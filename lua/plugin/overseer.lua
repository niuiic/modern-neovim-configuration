-- check `https://github.com/stevearc/overseer.nvim/blob/master/doc/guides.md#custom-tasks` for setting tasks

local config = function()
	require("overseer").setup({
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
end

local keys = {
	{ "<space>sl", "<cmd>OverseerToggle<CR>", desc = "toggle task list" },
	{ "<space>sr", "<cmd>OverseerRun<CR>", desc = "run tasks" },
	{ "<space>sr", "<c-u>OverseerRun<CR>", desc = "run tasks", mode = "v" },
	{ "<space>sc", "<cmd>OverseerClearCache<CR>", desc = "clear cache" },
	{
		"<space>sR",
		function()
			local overseer = require("overseer")
			local tasks = overseer.list_tasks({ recent_first = true })
			if vim.tbl_isempty(tasks) then
				vim.notify("No tasks found", vim.log.levels.WARN)
			else
				overseer.run_action(tasks[1], "restart")
			end
		end,
		desc = "restart last task",
	},
}

return {
	config = config,
	keys = keys,
}
