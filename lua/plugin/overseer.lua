local utils = require("utils")

-- check `https://github.com/stevearc/overseer.nvim/blob/master/doc/guides.md#custom-tasks` for setting tasks

utils.fn.require("overseer").setup({
	templates = {},
	task_list = {
		direction = "right",
	},
	template_timeout = 0,
	template_cache_threshold = 0,
})

utils.fn.whichKeyMap({
	s = {
		name = "tasks",
		l = {
			"<cmd>OverseerToggle<CR>",
			"toggle task list",
		},
		r = {
			"<cmd>OverseerRun<CR>",
			"run tasks",
		},
		c = {
			"<cmd>OverseerClearCache<CR>",
			"run tasks",
		},
		R = {
			function()
				local overseer = utils.fn.require("overseer")
				local tasks = overseer.list_tasks({ recent_first = true })
				if vim.tbl_isempty(tasks) then
					vim.notify("No tasks found", vim.log.levels.WARN)
				else
					overseer.run_action(tasks[1], "restart")
				end
			end,
			"restart last task",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})