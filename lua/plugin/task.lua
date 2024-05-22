return {
	keys = {
		{
			"<space>sr",
			function()
				require("task").launch()
			end,
			"launch task",
		},
		{
			"<space>so",
			function()
				require("task").preview()
			end,
			"preview task",
		},
	},
}
