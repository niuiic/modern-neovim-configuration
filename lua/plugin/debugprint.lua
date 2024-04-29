return {
	config = function()
		local vue = {
			left = "console.log(`",
			right = "')",
			mid_var = "`, ",
			right_var = ")",
		}
		require("debugprint").setup({
			keymaps = {},
			commands = {},
			move_to_debugline = true,
			filetypes = {
				vue = vue,
				javascript = vue,
				typescript = vue,
				javascriptreact = vue,
				typescriptreact = vue,
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<C-p>",
			function()
				return require("debugprint").debugprint({ variable = true })
			end,
			desc = "debug print",
			expr = true,
		},
		{
			"<C-p>",
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
