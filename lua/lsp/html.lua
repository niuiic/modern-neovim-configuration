local M = {
	capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true } } } },
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
}

return M
