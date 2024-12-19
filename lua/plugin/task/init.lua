return {
	config = function()
		local task_modules = { "rust", "js", "lua" }

		for _, module in ipairs(task_modules) do
			require("plugin.task." .. module)
		end
	end,
	keys = {
		{
			"<C-b>",
			function()
				require("task").run_task()
			end,
			desc = "run task",
		},
	},
	branch = "dev",
}
