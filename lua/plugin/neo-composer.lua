return {
	keys = {
		{
			"<space>rc",
			"<cmd>ClearNeoComposer<CR>",
			desc = "clear macros",
		},
	},
	config = function()
		require("NeoComposer").setup({
			keymaps = {
				play_macro = "R",
				yank_macro = "yr",
				stop_macro = "rs",
				toggle_record = "r",
				cycle_next = "<c-j>",
				cycle_prev = "<c-k>",
				toggle_macro_menu = "<space>ro",
			},
		})
	end,
	dependencies = { "kkharji/sqlite.lua" },
	lazy = false,
}
