local utils = require("utils")

local M = {
	modify_capabilities = function(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		return capabilities
	end,
	on_attach = function(client, _)
		if vim.bo.filetype == "vue" then
			client.server_capabilities.renameProvider = false -- disable rename feature
		end
	end,
	filetypes = { "css", "scss", "less", "vue" },
	root_dir = utils.fn.root_pattern,
}

return M
