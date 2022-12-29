-- keymap
require("which-key").register({
	g = {
		"<cmd>LazyGit<CR>",
		"lazygit",
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
