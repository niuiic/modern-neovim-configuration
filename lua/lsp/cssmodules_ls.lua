local core = require("niuiic-core")

local M = {
	root_dir = core.file.root_path,
	filetypes = { "javascriptreact", "typescriptreact", "vue" },
	on_attach = function(client, _)
		if vim.bo.filetype == "vue" then
			client.server_capabilities.hoverProvider = false
		end
	end,
}

return M
