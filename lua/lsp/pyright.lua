local utils = require("utils")

local M = {
	root_dir = utils.fn.root_pattern,
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
