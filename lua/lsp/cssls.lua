local M = {
	on_attach = function(client)
		if vim.bo.filetype == "vue" then
			client.server_capabilities.hoverProvider = false
		end
	end,
	filetypes = { "css", "scss", "less", "vue" },
}

return M
