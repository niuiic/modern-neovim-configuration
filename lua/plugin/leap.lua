local utils = require("utils")
local leap = utils.fn.require("leap")

leap.setup({
	safe_labels = {
		"a",
		"b",
		"d",
		"e",
		"g",
		"h",
		"i",
		"j",
		"k",
		"l",
		"m",
		"n",
		"o",
		"p",
		"q",
		"r",
		"s",
		"u",
		"v",
		"w",
		"x",
		"y",
		"z",
		"A",
		"B",
		"D",
		"E",
		"G",
		"H",
		"I",
		"J",
		"K",
		"L",
		"M",
		"N",
		"O",
		"P",
		"Q",
		"R",
		"S",
		"U",
		"V",
		"W",
		"X",
		"Y",
		"Z",
	},
})

vim.api.nvim_create_user_command("SearchAllWinsB", function()
	leap.leap({
		target_windows = vim.tbl_filter(function(win)
			return vim.api.nvim_win_get_config(win).focusable
		end, vim.api.nvim_tabpage_list_wins(0)),
	})
end, {})

vim.api.nvim_create_user_command("SearchAllWinsA", function()
	leap.leap({
		target_windows = vim.tbl_filter(function(win)
			return vim.api.nvim_win_get_config(win).focusable
		end, vim.api.nvim_tabpage_list_wins(0)),
		offset = 1,
	})
end, {})

utils.fn.require("hop").setup({})

utils.fn.map("n", "f", "<cmd>SearchAllWinsA<CR>", utils.var.opt)
utils.fn.map("n", "F", "<cmd>SearchAllWinsB<CR>", utils.var.opt)
utils.fn.map("v", "f", "<cmd>SearchAllWinsA<CR>", utils.var.opt)
utils.fn.map("v", "F", "<cmd>SearchAllWinsB<CR>", utils.var.opt)
utils.fn.map("n", "L", "<cmd>HopLine<CR>", utils.var.opt)
utils.fn.map("v", "L", "<cmd>HopLine<CR>", utils.var.opt)
utils.fn.map("n", "c", "<cmd>HopChar1<CR>", utils.var.opt)
utils.fn.map("v", "c", "<cmd>HopChar1<CR>", utils.var.opt)
