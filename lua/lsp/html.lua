local core = require("niuiic-core")

local M = {
	modify_capabilities = function(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		return capabilities
	end,
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
	filetypes = { "html", "vue", "typescriptreact", "javascriptreact" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = false,
	},
	root_dir = core.file.root_path,
}

return M
