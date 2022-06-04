local utils = require("utils")

utils.fn.require("nvim-cursorline").setup({
	cursorline = {
		enable = false,
		timeout = 1000,
		number = false,
	},
	cursorword = {
		enable = true,
		min_length = 2,
		hl = { underline = true },
	},
})
