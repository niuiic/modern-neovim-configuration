return {
	config = function()
		local task_modules = { "rust", "js", "lua", "markdown", "all", "python" }

		for _, module in ipairs(task_modules) do
			require("plugin.task." .. module)
		end
	end,
	keys = {
		{
			"<C-g>",
			function()
				require("task").run_task()
			end,
			desc = "run task",
			mode = { "n", "x" },
		},
	},
	branch = "dev",
}
