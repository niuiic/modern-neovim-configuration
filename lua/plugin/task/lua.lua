require("task").register_task({
	name = "run lua file",
	run = function()
		require("omega").dofile(vim.api.nvim_buf_get_name(0))
	end,
	is_enabled = function()
		return vim.bo.filetype == "lua"
	end,
})
