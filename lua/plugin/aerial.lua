local utils = require("utils")

utils.fn.require("aerial").setup({
	layout = {
		min_width = 30,
	},
})

-- keymap
utils.fn.whichKeyMap({
	m = {
		"<cmd>AerialToggle right<CR>",
		"tagbar",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
