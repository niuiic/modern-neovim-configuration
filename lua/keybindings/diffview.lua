utils = require("utils")

utils.fn.map("n", "<leader>do", ":DiffviewOpen ", utils.var.opt)
utils.fn.map("n", "<leader>dh", ":DiffviewFileHistory ", utils.var.opt)
utils.fn.mapRegister({
	d = {
		name = "diffview",
		o = "diff open (HEAD~2, d4a7b0d..519b30e)",
		q = {
			"<cmd>DiffviewClose<CR>",
			"close diff windows",
		},
		r = {
			"<cmd>DiffviewRefresh<CR>",
			"refresh",
		},
		h = "diff open (git) history (path to file or directory)",
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
