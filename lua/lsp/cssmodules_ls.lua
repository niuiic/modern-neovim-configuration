local utils = require("utils")

local M = {
	root_dir = utils.fn.root_pattern,
	filetypes = { "javascriptreact", "typescriptreact", "vue" },
	on_attach = function(client, _)
		if vim.bo.filetype == "vue" then
			client.server_capabilities.hoverProvider = false
		end
	end,
}

return M
