local utils = require("utils")

vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

-- focus on center
utils.fn.map("n", "J", "zz", utils.var.opt)

-- exit and refresh
utils.fn.map("n", "<C-x>", ":bd<CR>", utils.var.opt)
utils.fn.map("n", "<C-q>", ":q<CR>", utils.var.opt)
utils.fn.map("n", "<A-q>", ":q!<CR>", utils.var.opt)
utils.fn.map("n", "<C-n>", ":only<CR>", utils.var.opt)
utils.fn.map("n", "<C-e>", ":e<CR>", utils.var.opt)

-- save
utils.fn.map("n", "<C-s>", ":w!<CR>", utils.var.opt)
utils.fn.map("n", "<A-s>", ":wa!<CR>", utils.var.opt)

-- esc
utils.fn.map("i", "<C-c>", "<Esc>", utils.var.opt)

-- split windows
utils.fn.mapRegister({
	w = {
		name = "split windows",
		h = {
			"<cmd>sp<CR>",
			"split window horizontally",
		},
		v = {
			"<cmd>vsp<CR>",
			"split window vertically",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})

-- quickfix
utils.fn.mapRegister({
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

-- lsp
-- lspKeymaps.map = function(mapbuf)
	-- -- rename
	-- mapbuf("n", "gr", "<cmd>Lspsaga rename<CR>", utils.var.opt)
	-- -- code action
	-- mapbuf("n", "ga", "<cmd>Lspsaga code_action<CR>", utils.var.opt)
	-- mapbuf("x", "ga", ":<c-u>Lspsaga range_code_action<cr>", utils.var.opt)
	-- -- go xx
	-- mapbuf("n", "gh", "<cmd>Lspsaga signature_help<CR>", utils.var.opt)
	-- mapbuf("n", "K", "<cmd>Lspsaga hover_doc<cr>", utils.var.opt)
	-- mapbuf("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", utils.var.opt)
	-- mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", utils.var.opt)
	-- mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", utils.var.opt)
	-- -- diagnostic
	-- mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", utils.var.opt)
-- end
