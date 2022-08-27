local utils = require("utils")

-- keymap
utils.fn.whichKeyMap({
	g = {
		"<cmd>LazyGit<CR>",
		"lazygit",
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
