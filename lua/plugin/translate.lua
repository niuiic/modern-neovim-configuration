local config = function()
	require("translate").setup({
		translate = {
			{
				cmd = "TransToZH",
				command = "trans",
				args = function(trans_source)
					return {
						"-b",
						"-e",
						"bing",
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
						"bing",
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
			desc = "translate en to zh",
		},
	},
	dependencies = { "niuiic/core.nvim" },
}
