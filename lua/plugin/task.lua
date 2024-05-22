local split_win

return {
	config = function()
		split_win = require("task.output").use_split_win()
	end,
	keys = {
		{
			"<space>sr",
			function()
				require("task").launch(nil, {
					function(_, task_name)
						vim.notify(string.format("Task %s finished", task_name), vim.log.levels.INFO, {
							title = "Task",
						})
					end,
					split_win,
				})
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
