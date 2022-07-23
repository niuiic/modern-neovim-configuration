local utils = require("utils")

local M = {
	root_dir = utils.fn.rootPattern,
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
