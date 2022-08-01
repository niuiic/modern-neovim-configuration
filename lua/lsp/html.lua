local M = {
	modify_capabilities = function(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		return capabilities
	end,
    filetypes={"html","vue"}
}

return M
