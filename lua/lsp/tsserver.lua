local core = require("niuiic-core")

local filetypes = {
	"javascript",
	"typescript",
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

	vim.lsp.util.rename(source_file, target_file)
	vim.cmd("e")
	vim.lsp.buf.execute_command(params)
end

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = {
			vim.api.nvim_buf_get_name(0),
		},
	}

	vim.lsp.buf.execute_command(params)
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
}

return M
