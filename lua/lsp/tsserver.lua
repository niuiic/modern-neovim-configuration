local M = {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_dir = require("utils").fn.rootPattern,
	init_options = {
		hostInfo = "neovim",
	},
}

return M
