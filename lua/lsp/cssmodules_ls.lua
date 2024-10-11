local M = {
	filetypes = { "javascriptreact", "typescriptreact", "vue" },
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
}

return M
