require("lspconfig.configs").vtsls = require("vtsls").lspconfig

vim.api.nvim_create_user_command("VtslsRename", function()
	vim.lsp.buf.rename(nil, {
		name = "vtsls",
	})
end, {})

local fix_type_import = function()
	local diagnostic = vim.iter(vim.diagnostic.get()):find(function(diagnostic)
		local targets = {
			"@typescript-eslint/consistent-type-imports",
			"@typescript-eslint/no-import-type-side-effects",
		}
		return vim.list_contains(targets, diagnostic.code)
			or string.find(diagnostic.message, "is declared but its value is never read")
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
			local targets = {
				"Fix this @typescript-eslint/consistent-type-imports problem",
				"Fix this @typescript-eslint/no-import-type-side-effects problem",
				"Delete all unused imports",
			}
			return vim.iter(targets):find(function(target)
				return string.find(action.title, target, 1, true) ~= nil
			end)
		end,
	})
	vim.api.nvim_win_set_cursor(0, cur_pos)
end

vim.api.nvim_create_user_command("VtslsOrganizeImports", function()
	vim.cmd("VtsExec add_missing_imports")
	fix_type_import()
end, {})

local M = {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	settings = {
		vtsls = { tsserver = { globalPlugins = {} } },
	},
	before_init = function(_, config)
		local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
		if require("omega").exist_in_file("vue", root_dir .. "/package.json") then
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
