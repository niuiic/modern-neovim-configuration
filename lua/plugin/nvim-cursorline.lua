local utils = require("utils")

utils.fn.require("nvim-cursorline").setup({
	cursorline = {
		enable = false,
	},
	cursorword = {
		enable = true,
		min_length = 2,
		hl = { underline = true },
	},
})
