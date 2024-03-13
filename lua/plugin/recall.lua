return {
	config = function()
		require("recall").setup({})
		require("telescope").load_extension("recall")
	end,
	keys = {
		{
			"mm",
			"<cmd>RecallToggle<CR>",
			desc = "toggle mark",
		},
		{
			"mj",
			"<cmd>RecallNext<CR>",
			desc = "jump to next mark",
		},
		{
			"mk",
			"<cmd>RecallPrevious<CR>",
			desc = "jump to previous mark",
		},
		{
			"<space>om",
			"<cmd>Telescope recall<CR>",
			desc = "search marks",
		},
	},
}
