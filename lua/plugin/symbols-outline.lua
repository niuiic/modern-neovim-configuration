local utils = require("utils")

utils.fn.require("symbols-outline").setup()

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
