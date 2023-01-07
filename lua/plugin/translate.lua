local config = function()
	require("translate").setup({
		output = {
			float = {
				max_width = 20,
				max_height = 5,
				close_on_cursor_move = false,
			},
		},
		translate = {
			{
				cmd = "TransToZH",
				command = "trans",
				args = function(trans_source)
					return {
						"-b",
						"-e",
						"google",
						"-x",
						"http://127.0.0.1:10025",
						"-t",
						"zh-CN",
						trans_source,
					}
				end,
				input = "selection",
				output = { "float_win" },
			},
			{
				cmd = "TransToEN",
				command = "trans",
				args = function(trans_source)
					return {
						"-b",
						"-e",
						"google",
						"-x",
						"http://127.0.0.1:10025",
						"-t",
						"en",
						trans_source,
					}
				end,
				input = "input",
				output = { "notify", "clipboard" },
				filter = function(trans_source)
					return trans_source
				end,
			},
		},
	})
end

return {
	config = config,
	keys = {
		{
			"<C-t>",
			":<c-u>TransToZH<CR>",
			mode = "v",
			silent = true,
		},
		{
			"<space>T",
			"<cmd>TransToEN<CR>",
			mode = "n",
		},
	},
}
