return {
	config = function()
		local split_win = require("task.output").use_split_win()

		require("task").register({
			name = "run lua",
			config = function()
				return {
					cmd = "luajit",
					args = { vim.api.nvim_buf_get_name(0) },
				}
			end,
			on_exit = {
				require("task.output").notify_done,
				split_win,
			},
		})
	end,
	keys = {
		{
			"<space>sr",
			function()
				require("task").launch()
			end,
			desc = "launch task",
		},
		{
			"<space>so",
			function()
				require("task").preview()
			end,
			desc = "preview task",
		},
	},
}
