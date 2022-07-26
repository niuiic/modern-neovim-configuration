local utils = require("utils")

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
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_dir = utils.fn.root_pattern,
}

return M
