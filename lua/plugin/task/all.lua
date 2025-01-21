require("task").register_task({
	name = "echo file name",
	run = function()
		vim.notify(vim.api.nvim_buf_get_name(0))
	end,
})
