local config = function()
	local leap = require("leap")

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

	require("hop").setup({})
end

local keys = {
	{ "f", "<cmd>SearchAllWinsA<CR>" },
	{ "f", "<cmd>SearchAllWinsA<CR>", mode = "v" },
	{ "F", "<cmd>SearchAllWinsB<CR>" },
	{ "F", "<cmd>SearchAllWinsB<CR>", mode = "v" },
	{ "L", "<cmd>HopLine<CR>" },
	{ "L", "<cmd>HopLine<CR>", mode = "v" },
	{ "e", "<cmd>HopChar1<CR>" },
	{ "e", "<cmd>HopChar1<CR>", mode = "v" },
}

return {
	config = config,
	keys = keys,
}
