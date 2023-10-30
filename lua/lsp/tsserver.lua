local core = require("core")

local filetypes = {
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
}

if core.file.file_contains(core.file.root_path() .. "/package.json", "vue") then
	filetypes = { "none" }
end

local function rename_file()
	local source_file = vim.api.nvim_buf_get_name(0)
	local target_file = ""

	vim.ui.input({
		prompt = "Target : ",
		completion = "file",
		default = source_file,
	}, function(input)
		if input ~= nil then
			target_file = input
		end
	end)

	-- return if input is canceled
	if target_file == "" then
		return
	end

	local params = {
		command = "_typescript.applyRenameFile",
		arguments = {
			{
				sourceUri = source_file,
				targetUri = target_file,
			},
		},
	}

	vim.lsp.util.rename(source_file, target_file, {})
	vim.cmd("e")
	vim.lsp.buf.execute_command(params)
end

local function organize_imports()
	local diagnostic_list = vim.diagnostic.get()
	local diagnostic = core.lua.list.find(diagnostic_list, function(diagnostic)
		return string.find(diagnostic.message, "Cannot find name") or string.find(diagnostic.message, "is not defined")
	end)
	if diagnostic == nil then
		return
	end
	local cur_pos = vim.api.nvim_win_get_cursor(0)
	vim.api.nvim_win_set_cursor(0, {
		diagnostic.lnum + 1,
		diagnostic.col,
	})
	vim.lsp.buf.code_action({
		apply = true,
		filter = function(action)
			return action.title == "Add all missing imports"
				or string.find(action.title, "Update import from")
				or string.find(action.title, "Add import from")
		end,
	})
	vim.api.nvim_win_set_cursor(0, cur_pos)
end

local M = {
	filetypes = filetypes,
	init_options = {
		hostInfo = "neovim",
	},
	commands = {
		TsserverRenameFile = {
			rename_file,
			description = "Rename File",
		},
		TsserverOrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
		TsserverRename = {
			function()
				vim.lsp.buf.rename(nil, {
					name = "tsserver",
				})
			end,
			description = "Rename",
		},
	},
	root_dir = core.file.root_path,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
}

return M
