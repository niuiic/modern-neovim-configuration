return {
	keys = {
		{
			"<space>sr",
			function()
				require("task").launch(nil, require("task.output").use_split_win())
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
