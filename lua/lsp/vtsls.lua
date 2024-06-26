local core = require("core")

require("lspconfig.configs").vtsls = require("vtsls").lspconfig

vim.api.nvim_create_user_command("VtslsRename", function()
	vim.lsp.buf.rename(nil, {
		name = "vtsls",
	})
end, {})

local fix_type_import = function()
	local diagnostic_list = vim.diagnostic.get()
	local diagnostic = core.lua.list.find(diagnostic_list, function(diagnostic)
		return diagnostic.code == "@typescript-eslint/consistent-type-imports"
			or diagnostic.code == "@typescript-eslint/no-import-type-side-effects"
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
			return action.title == "Fix this @typescript-eslint/consistent-type-imports problem"
				or action.title == "Fix this @typescript-eslint/no-import-type-side-effects problem"
		end,
	})
	vim.api.nvim_win_set_cursor(0, cur_pos)
end

vim.api.nvim_create_user_command("VtslsOrganizeImports", function()
	vim.cmd("VtsExec add_missing_imports")
	fix_type_import()
end, {})

local M = {
	root_dir = core.file.root_path,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	settings = {
		vtsls = { tsserver = { globalPlugins = {} } },
	},
	before_init = function(_, config)
		local root_dir = core.file.root_path()
		if core.file.file_contains(root_dir .. "/package.json", "vue") then
			local vuePluginConfig = {
				name = "@vue/typescript-plugin",
				location = require("mason-registry").get_package("vue-language-server"):get_install_path()
					.. "/node_modules/@vue/language-server",
				languages = { "vue" },
				configNamespace = "typescript",
				enableForWorkspaceTypeScriptVersions = true,
			}
			table.insert(config.settings.vtsls.tsserver.globalPlugins, vuePluginConfig)
		end
	end,
}

return M
