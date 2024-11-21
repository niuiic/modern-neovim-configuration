require("lspconfig.configs").vtsls = require("vtsls").lspconfig

local function is_enabled()
	return #vim.lsp.get_clients({
		name = "vtsls",
	}) > 0
end

require("lsp-commands").register_command({
	name = "vtsls/rename vars",
	run = function()
		vim.lsp.buf.rename(nil, {
			name = "vtsls",
		})
	end,
	is_enabled = is_enabled,
})

require("lsp-commands").register_command({
	name = "vtsls/organize imports",
	run = function()
		vim.cmd("VtsExec add_missing_imports")
	end,
	is_enabled = is_enabled,
})

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
