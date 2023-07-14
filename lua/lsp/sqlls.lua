local core = require("core")

local M = {
	root_dir = core.file.root_path,
	settings = {
		sqlLanguageServer = {
			lint = {
				rules = {
					["linebreak-after-clause-keyword"] = "off",
				},
			},
		},
	},
}

return M
