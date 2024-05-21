return {
	keys = {
		{
			"<space>sr",
			function()
				require("task").launch(nil, require("task.output").split_win)
			end,
			"launch task",
		},
	},
}
