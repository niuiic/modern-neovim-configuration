local config = function()
	require("translate").setup({
		translate = {
			{
				cmd = "TransToZH",
				command = "curl",
				args = function(trans_source)
					return {
						"-X",
						"POST",
						"http://localhost:1188/translate",
						"-H",
						"Content-Type: application/json",
						"-d",
						vim.fn.json_encode({
							text = trans_source,
							source_lang = "EN",
							target_lang = "ZH",
						}),
						"-s",
					}
				end,
				input = "selection",
				output = { "float_win" },
				format = function(output)
					local data = vim.fn.json_decode(output)
					return data.data
				end,
			},
			{
				cmd = "TransToEN",
				command = "curl",
				args = function(trans_source)
					return {
						"-X",
						"POST",
						"http://localhost:1188/translate",
						"-H",
						"Content-Type: application/json",
						"-d",
						vim.fn.json_encode({
							text = trans_source,
							target_lang = "EN",
							source_lang = "ZH",
						}),
						"-s",
					}
				end,
				input = "input",
				output = { "notify", "clipboard" },
				format = function(output)
					local data = vim.fn.json_decode(output)
					return data.data
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
			"<cmd>TransToZH<CR>",
			mode = { "n", "v" },
			silent = true,
		},
		{
			"<space>T",
			"<cmd>TransToEN<CR>",
			desc = "translate en to zh",
		},
	},
}
