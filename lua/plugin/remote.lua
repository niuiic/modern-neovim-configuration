return {
	config = function()
		require("remote").setup({
			config_file = (vim.fs.root(0, ".git") or vim.fn.getcwd()) .. "/.nvim/remote/config.json",
			log_file = (vim.fs.root(0, ".git") or vim.fn.getcwd()) .. "/.nvim/remote/log",
			on_each_disconnected = function(config)
				if vim.uv.fs_stat(config.mount_point) and not vim.uv.fs_readdir(config.mount_point) then
					vim.uv.fs_rmdir(config.mount_point)
				end
			end,
		})
	end,
	keys = {
		{
			"<leader>ec",
			function()
				require("remote").connect()
			end,
			desc = "connect",
		},
		{
			"<leader>ed",
			function()
				require("remote").disconnect()
			end,
			desc = "disconnect",
		},
		{
			"<leader>er",
			function()
				require("remote").reconnect()
			end,
			desc = "reconnect",
		},
		{
			"<leader>ee",
			function()
				require("remote").edit_config()
			end,
			desc = "edit config",
		},
		{
			"<leader>el",
			function()
				require("remote").check_log()
			end,
			desc = "check log file",
		},
	},
}
