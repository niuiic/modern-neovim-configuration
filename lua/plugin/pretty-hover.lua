return {
	config = function()
		require("pretty_hover").setup()
	end,
	keys = {
		{
			"J",
			function()
				require("pretty_hover").hover()
			end,
			desc = "lsp hover",
		},
	},
}
