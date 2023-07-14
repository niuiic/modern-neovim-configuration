local core = require("core")

local M = {
	root_dir = core.file.root_path,
	filetypes = { "javascriptreact", "typescriptreact", "vue" },
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
}

return M
