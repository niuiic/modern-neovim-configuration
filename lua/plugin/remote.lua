return {
	config = function()
		require("remote").setup()
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
	},
}
