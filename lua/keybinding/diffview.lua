local utils = require("utils")

utils.fn.map("n", "<leader>ds", ":DiffviewOpen ", utils.var.opt)
utils.fn.mapRegister({
	d = {
		name = "diffview",
		s = { "diff open specifically" },
		o = {
			"<cmd>DiffviewOpen<CR>",
			"diff open",
		},
		h = {
			"<cmd>DiffviewFileHistory<CR>",
			"diff open (git) history (path to file or directory)",
		},
		q = {
			"<cmd>DiffviewClose<CR>",
			"close diff windows",
		},
		r = {
			"<cmd>DiffviewRefresh<CR>",
			"refresh",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
