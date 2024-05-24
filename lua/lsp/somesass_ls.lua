local core = require("core")

return {
	root_dir = core.file.root_path,
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
}
