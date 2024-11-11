local M = {
	capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true } } } },
	filetypes = { "html", "vue", "typescriptreact", "javascriptreact" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = false,
	},
	on_attach = function(client)
		client.server_capabilities.hoverProvider = false
	end,
}

return M
