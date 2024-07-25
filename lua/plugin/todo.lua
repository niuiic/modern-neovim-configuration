return {
	config = function()
		require("todo").setup()
	end,
	keys = {
		{
			"<space>p",
			function()
				require("todo").search_all()
			end,
			desc = "search all todos",
		},
		{
			"<space>ot",
			function()
				require("todo").search_upstream()
			end,
			desc = "search upstream todos",
		},
		{
			"<space>oT",
			function()
				require("todo").search_downstream()
			end,
			desc = "search downstream todos",
		},
	},
	lazy = false,
}
