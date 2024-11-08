local M = {
	capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true } } } },
	on_attach = function(client)
		if vim.bo.filetype == "vue" then
			client.server_capabilities.hoverProvider = false
		end
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
