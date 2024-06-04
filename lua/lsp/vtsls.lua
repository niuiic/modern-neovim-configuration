local core = require("core")

require("lspconfig.configs").vtsls = require("vtsls").lspconfig

vim.api.nvim_create_user_command("VtslsRename", function()
	vim.lsp.buf.rename(nil, {
		name = "vtsls",
	})
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
