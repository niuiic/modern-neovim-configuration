local utils = require("utils")

utils.fn.require("symbols-outline").setup({
	width = 40,
})

-- keymap
utils.fn.whichKeyMap({
	m = {
		"<cmd>SymbolsOutline<CR>",
		"toggle tagbar",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
