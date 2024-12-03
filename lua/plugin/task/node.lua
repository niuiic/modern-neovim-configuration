require("task").register_task({
	name = "run node project scripts",
	run = function()
		local scripts = vim.json.decode(
			vim.fn.join(vim.fn.readfile(vim.fs.root(0, "package.json") .. "/package.json"), "\n")
		).scripts

		if not scripts or vim.tbl_isempty(scripts) then
			vim.notify("no scripts found in package.json", vim.log.levels.WARN)
			return
		end

		local tasks = vim.tbl_values(scripts)

		if #tasks == 1 then
			require("plugin.task.utils").run_in_term({
				"cd " .. vim.fs.root(0, "package.json"),
				"pnpm " .. tasks[1],
			})
			return
		end

		vim.ui.select(tasks, { prompt = "select script to run" }, function(choice)
			if not choice then
				return
			end

			require("plugin.task.utils").run_in_term({
				"cd " .. vim.fs.root(0, "package.json"),
				"pnpm " .. choice,
			})
		end)
	end,
	is_enabled = function()
		return vim.fs.root(0, "package.json") ~= nil
	end,
})
