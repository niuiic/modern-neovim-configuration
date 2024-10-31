return {
	config = function()
		local split_win = require("task.output").use_split_win()

		require("task").register({
			name = "launch rust project",
			is_enabled = function()
				return vim.bo.filetype == "rust"
			end,
			config = function()
				return {
					cmd = "cargo",
					args = { "run" },
					options = { cwd = vim.fs.root(0, "Cargo.toml") },
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
