local utils = require("utils")

local M = {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	init_options = {
		hostInfo = "neovim",
	},
	root_dir = utils.fn.root_pattern,
}

return M
