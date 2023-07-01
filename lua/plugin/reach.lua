return {
	config = function()
		require("reach").setup({})
	end,
	keys = {
		{
			"<A-m>",
			"<cmd>:delm a-z A-Z<CR>",
			desc = "delete all marks",
		},
		{ "<space>om", "<cmd>ReachOpen marks<CR>", desc = "search marks" },
	},
}
