local core = require("core")

local M = {
	settings = {},
	filetypes = {
		"css",
		"less",
		"scss",
		"sugarss",
		"vue",
		"wxss",
		"javascriptreact",
		"typescriptreact",
	},
	root_dir = core.file.root_path,
}

return M
