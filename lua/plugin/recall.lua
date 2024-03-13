return {
	config = function()
		require("recall").setup({})
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
			"mc",
			"<cmd>RecallClear<CR>",
			desc = "clear all marks",
		},
		{
			"<space>om",
			"<cmd>Telescope recall<CR>",
			desc = "search marks",
		},
	},
}
