return {
	config = function()
		require("undotree").setup({})
	end,
	keys = {
		{
			"<space>u",
			function()
				require("undotree").toggle()
			end,
			desc = "undotree",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
