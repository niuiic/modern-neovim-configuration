return {
	config = function()
		require("macro").setup({ notify_on_play = false })
	end,
	keys = {
		{
			"r",
			function()
				require("macro").toggle_record()
			end,
			desc = "record macro",
		},
		{
			"R",
			function()
				require("macro").play_macro()
			end,
			desc = "play macro",
			expr = true,
		},
	},
}
