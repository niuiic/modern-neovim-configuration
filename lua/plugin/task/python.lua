require("task").register_task({
	name = "run python file",
	run = function()
		require("plugin.task.utils").run_in_term({
			"python " .. vim.api.nvim_buf_get_name(0),
		})
	end,
	is_enabled = function()
		return vim.bo.filetype == "python"
	end,
})
