return {
	config = function()
		require("debugprint").setup({
			create_keymaps = false,
			create_commands = false,
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<space>dp",
			function()
				return require("debugprint").debugprint({ variable = true })
			end,
			desc = "debug print",
			expr = true,
		},
		{
			"<space>dp",
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
