return {
	keys = {
		{
			"<space>wm",
			function()
				require("window").maximize()
			end,
			desc = "toggle max win",
		},
	},
	dependencies = { "niuiic/niuiic-core.nvim" },
}
