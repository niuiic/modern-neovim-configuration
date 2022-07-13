local M = {
	modify_capabilities = function(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		return capabilities
	end,
	filetypes = { "css", "scss", "less", "vue" },
}

return M
