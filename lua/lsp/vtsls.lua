local function is_enabled()
	return require("tools.lsp_valid")("vtsls")
end

local function code_action(filter)
	return function()
		vim.lsp.buf.code_action({ apply = true, filter = filter })
	end
end

-- vtsls' own extension commands, registered as lsp commands
local commands = {
	["_typescript.applyFixAllCodeAction"] = code_action(function(action)
		return action.title == "Fix all"
	end),
	["_typescript.organizeImports"] = code_action(function(action)
		return action.title == "Sort Imports" or action.title == "Remove Unused Imports"
	end),
	["_typescript.applyWorkspaceEdit"] = function(command)
		for _, edit in ipairs(command.arguments[1].edits or {}) do
			local start, finish = edit.range.start, edit.range["end"]
			vim.api.nvim_buf_set_text(
				vim.uri_to_bufnr(edit.fileName),
				start.line,
				start.character,
				finish.line,
				finish.character,
				vim.split(edit.newText, "\n")
			)
		end
	end,
}

require("lsp-commands").register_command({
	name = "vtsls/rename var",
	run = function()
		vim.lsp.buf.rename(nil, {
			name = "vtsls",
		})
	end,
	is_enabled = is_enabled,
})

require("lsp-commands").register_command({
	name = "vtsls/organize imports",
	run = commands["_typescript.organizeImports"],
	is_enabled = is_enabled,
})

require("lsp-commands").register_command({
	name = "vtsls/fix all",
	run = commands["_typescript.applyFixAllCodeAction"],
	is_enabled = is_enabled,
})

return {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	settings = {
		typescript = { updateImportsOnFileMove = { enabled = "always" } },
		javascript = { updateImportsOnFileMove = { enabled = "always" } },
		vtsls = { enableMoveToFileCodeAction = true, tsserver = { globalPlugins = {} } },
	},
	before_init = function(_, config)
		local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
		if require("omega").exist_in_file("vue", root_dir .. "/package.json") then
			local vue_plugin = {
				name = "@vue/typescript-plugin",
				languages = { "vue" },
				configNamespace = "typescript",
				location = vim.fn.expand("$MASON/packages")
					.. "/vue-language-server"
					.. "/node_modules/@vue/language-server",
			}
			table.insert(config.settings.vtsls.tsserver.globalPlugins, vue_plugin)
		end
	end,
	root_dir = function(bufnr, on_dir)
		on_dir(vim.fs.root(bufnr, ".git") or vim.fn.getcwd())
	end,
	commands = commands,
}
