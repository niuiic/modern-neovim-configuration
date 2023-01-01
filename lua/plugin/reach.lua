return {
	config = function()
		require("reach").setup({})
	end,
	keys = {
		-- delete all marks
		{
			"<A-m>",
			"<cmd>:delm a-z A-Z<CR>",
		},
		{ "<space>om", "<cmd>ReachOpen marks<CR>", desc = "search marks" },
	},
}
