return {
	config = function()
		local task_modules = { "rust", "js" }

		for _, module in ipairs(task_modules) do
			require("plugin.task." .. module)
		end
	end,
	keys = {
		{
			"<space>sr",
			function()
				require("task").run_task()
			end,
			desc = "run task",
		},
	},
	branch = "dev",
}
