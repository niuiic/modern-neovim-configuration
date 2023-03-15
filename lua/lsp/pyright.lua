local core = require("niuiic-core")

local M = {
	root_dir = core.file.root_path,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
}

return M
