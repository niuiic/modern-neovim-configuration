local utils = require("utils")

-- check `https://github.com/stevearc/overseer.nvim/blob/master/doc/guides.md#custom-tasks` for setting tasks

utils.fn.require("overseer").setup({
	templates = {},
	task_list = {
		direction = "right",
		bindings = {
			["?"] = "ShowHelp",
			["<CR>"] = "RunAction",
			["<C-e>"] = "Edit",
			["o"] = "Open",
			["<C-v>"] = "OpenVsplit",
			["<C-s>"] = "OpenSplit",
			["<C-f>"] = "OpenFloat",
			["K"] = "OpenQuickFix",
			["p"] = "TogglePreview",
			["<C-j>"] = "IncreaseDetail",
			["<C-k>"] = "DecreaseDetail",
			["L"] = "IncreaseAllDetail",
			["H"] = "DecreaseAllDetail",
			["["] = "DecreaseWidth",
			["]"] = "IncreaseWidth",
			["{"] = "PrevTask",
			["}"] = "NextTask",
		},
	},
	template_timeout = 0,
	template_cache_threshold = 0,
})

utils.fn.require("which-key").register({
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
			"clear cache",
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
