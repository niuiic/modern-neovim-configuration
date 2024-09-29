return {
	keys = {
		{
			"<space>sr",
			function()
				require("task").launch()
			end,
			desc = "launch task",
		},
		{
			"<space>so",
			function()
				require("task").preview()
			end,
			desc = "preview task",
		},
	},
}
