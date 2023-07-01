return {
	config = function()
		require("debugprint").setup({
			create_keymaps = false,
			create_commands = false,
			filetypes = {
				vue = {
					left = "console.log('",
					right = "')",
					mid_var = "', ",
					right_var = ")",
				},
				javascriptreact = {
					left = "console.log('",
					right = "')",
					mid_var = "', ",
					right_var = ")",
				},
				typescriptreact = {
					left = "console.log('",
					right = "')",
					mid_var = "', ",
					right_var = ")",
				},
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<A-p>",
			function()
				return require("debugprint").debugprint({ variable = true })
			end,
			desc = "debug print",
			expr = true,
		},
		{
			"<A-p>",
			function()
				return require("debugprint").debugprint({ variable = true })
			end,
			desc = "debug print",
			expr = true,
			mode = "v",
		},
		{
			"<space>dd",
			function()
				require("debugprint").deleteprints()
			end,
			desc = "remove all debug print",
		},
	},
}
