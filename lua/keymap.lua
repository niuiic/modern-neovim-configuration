local utils = require("utils")

vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

-- exit and refresh
utils.fn.map("n", "<C-q>", ":q<CR>", utils.var.opt)
utils.fn.map("n", "<A-q>", ":q!<CR>", utils.var.opt)
utils.fn.map("n", "<C-n>", ":only<CR>", utils.var.opt)
utils.fn.map("n", "<C-e>", ":e<CR>", utils.var.opt)

-- save
utils.fn.map("n", "<C-s>", ":SaveAndSaveQf<CR>", utils.var.opt)
utils.fn.map("n", "<A-s>", ":wa!<CR>", utils.var.opt)

-- esc
utils.fn.map("i", "<C-c>", "<Esc>", utils.var.opt)

-- quickfix
utils.fn.whichKeyMap({
	q = {
		name = "quickfix",
		o = {
			"<cmd>cope25<CR>",
			"open quickfix window",
		},
		m = {
			"<cmd>make<CR>",
			"make",
		},
		c = {
			"<cmd>cclose<CR>",
			"close quickfix window",
		},
		e = {
			"<cmd>set modifiable<CR>",
			"set quickfix modifiable",
		},
		r = {
			"<cmd>LoadQf<CR>",
			"load quickfix history",
		},
		w = {
			"<cmd>WriteQf<CR>",
			"save quickfix",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
utils.fn.map("n", "<A-j>", ":cnext<CR>", utils.var.opt)
utils.fn.map("n", "<A-k>", ":cprev<CR>", utils.var.opt)
utils.fn.map("n", "<A-g>", ":cfirst<CR>", utils.var.opt)
utils.fn.map("n", "<A-G>", ":clast<CR>", utils.var.opt)

-- copy to systemclip
utils.fn.map("x", "Y", '"+y<Esc>', utils.var.opt)

-- unmap
utils.fn.map("n", "gd", "", utils.var.opt)

-- plugin operation
utils.fn.whichKeyMap({
	p = {
		name = "plugin",
		u = {
			"<cmd>PackerSync<CR>",
			"update plugins",
		},
		l = {
			"<cmd>LspInfo<CR>",
			"lsp info",
		},
		i = {
			"<cmd>Mason<CR>",
			"lsp install info",
		},
		c = {
			"<cmd>checkhealth<CR>",
			"checkhealth",
		},
		t = {
			"<cmd>TSUpdate<CR>",
			"update language parsers of nvim-treesitter",
		},
		m = {
			"<cmd>messages<CR>",
			"show messages",
		},
		d = {
			function()
				utils.fn.require("osv").run_this()
			end,
			"debug neovim",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
