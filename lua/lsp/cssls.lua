local M = {
	capabilities = {
		textDocument = { completion = { completionItem = { snippetSupport = true } } },
	},
	on_attach = function(client, _)
		if vim.bo.filetype == "vue" then
			client.server_capabilities.hoverProvider = false
		end
	end,
	filetypes = { "css", "scss", "less", "vue" },
}

return M
