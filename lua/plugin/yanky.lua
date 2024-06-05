return {
	config = function()
		require("yanky").setup({
			picker = {
				telescope = {
					mappings = {
						i = {
							["<C-j>"] = "move_selection_next",
							["<C-k>"] = "move_selection_previous",
						},
					},
				},
			},
		})
	end,
	keys = {
		{
			"<space>p",
			function()
				require("telescope").extensions.yank_history.yank_history()
			end,
			desc = "yank history",
		},
	},
	lazy = false,
}
