require("utils").fn.whichKeyMap({
	a = {
		"<cmd>StartupTime<CR>",
		"check startup time",
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
