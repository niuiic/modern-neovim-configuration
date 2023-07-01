return {
	keys = {
		{
			"f",
			mode = { "n", "v", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "flash",
		},
	},
	event = "VeryLazy",
}
