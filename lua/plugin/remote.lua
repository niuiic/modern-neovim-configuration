return {
	config = function()
		local core = require("core")

		require("remote").setup({
			on_each_disconnected = function(config)
				if core.file.empty_dir(config.mount_point) then
					core.file.rmdir(config.mount_point)
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
