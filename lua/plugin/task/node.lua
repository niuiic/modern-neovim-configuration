require("task").register_task({
	name = "build node project",
	run = function()
		require("plugin.task.utils").run_in_term({
			"cd " .. vim.fs.root(0, "package.json"),
			"pnpm build",
		})
	end,
	is_enabled = function()
		return vim.fs.root(0, "package.json") ~= nil
	end,
})
