local utils = require("utils")

utils.fn.map("n", "<C-k>", ":BufferLineCycleNext<CR>", utils.var.opt)
utils.fn.map("n", "<C-j>", ":BufferLineCyclePrev<CR>", utils.var.opt)
utils.fn.mapRegister({
	b = {
		name = "bufferline",
		p = {
			"<cmd>BufferLineMovePrev<CR>",
			"move current tab to previous position",
		},
		n = {
			"<cmd>BufferLineMoveNext<CR>",
			"move current tab to next position",
		},
		e = {
			"<cmd>BufferLineSortByExtension<CR>",
			"sort tabs by extension",
		},
		d = {
			"<cmd>BufferLineSortByExtension<CR>",
			"sort tabs by directory",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
