local M = {
	modify_capabilities = function(capabilities)
		capabilities.offsetEncoding = "utf-8"
		return capabilities
	end,
}

return M
