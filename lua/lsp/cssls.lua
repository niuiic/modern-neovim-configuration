local M = {
	modify_capabilities = function(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		return capabilities
	end,
	on_attach = function(client, _)
		if vim.bo.filetype == "vue" then
			client.server_capabilities.hoverProvider = false
		end
	end,
	filetypes = { "css", "scss", "less", "vue" },
}

return M
