return {
	config = function()
		require("yanky").setup({
			picker = {
				telescope = {
					use_default_mappings = false,
				},
			},
		})
	end,
	keys = {
		{
			"<space>oy",
			function()
				require("telescope").extensions.yank_history.yank_history()
			end,
			desc = "yank history",
		},
	},
	lazy = false,
}
