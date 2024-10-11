return {
	keys = {
		{
			"<space>wm",
			function()
				require("window").maximize()
			end,
			desc = "maximize window",
		},
		{
			"<space>wp",
			function()
				require("window").pin()
			end,
			desc = "pin window",
		},
	},
}
