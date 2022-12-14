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

vim.keymap.set("n", "f", "<cmd>SearchAllWinsA<CR>", { silent = true })
vim.keymap.set("n", "F", "<cmd>SearchAllWinsB<CR>", { silent = true })
vim.keymap.set("v", "f", "<cmd>SearchAllWinsA<CR>", { silent = true })
vim.keymap.set("v", "F", "<cmd>SearchAllWinsB<CR>", { silent = true })
vim.keymap.set("n", "L", "<cmd>HopLine<CR>", { silent = true })
vim.keymap.set("v", "L", "<cmd>HopLine<CR>", { silent = true })
vim.keymap.set("n", "e", "<cmd>HopChar1<CR>", { silent = true })
vim.keymap.set("v", "e", "<cmd>HopChar1<CR>", { silent = true })
