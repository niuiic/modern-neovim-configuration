local M = {
	modify_capabilities = function(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		-- disable rename feature
		capabilities.rename = {
			dynamicRegistration = false,
			prepareSupport = false,
		}
		capabilities.textDocument.rename = {
			dynamicRegistration = false,
			prepareSupport = false,
		}
		-- FIXME: unable to disable rename feature
		return capabilities
	end,
	filetypes = { "css", "scss", "less", "vue" },
}

return M
