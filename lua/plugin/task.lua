return {
	keys = {
		{
			"<space>sr",
			function()
				require("task").launch(nil, require("task.output").to_split_win)
			end,
			"launch task",
		},
	},
}
