local core = require("niuiic-core")

local M = {
	settings = {
		stylelintplus = {
			-- see available options in stylelint-lsp documentation
		},
	},
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
