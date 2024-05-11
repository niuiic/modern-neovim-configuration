return {
	config = function()
		require("outline").setup({
			outline_items = {
				show_symbol_details = false,
			},
			preview_window = {
				auto_preview = true,
			},
		})
	end,
	keys = {
		{
			"<space>lo",
			function()
				require("outline").toggle({
					focus_outline = false,
				})
			end,
			desc = "outline",
		},
	},
}
