return {
	config = function()
		require("track").setup({})
	end,
	keys = {
		{
			"mm",
			function()
				require("track").toggle()
			end,
			desc = "toggle mark",
		},
		{
			"mc",
			function()
				require("track").remove()
			end,
			desc = "remove all marks",
		},
		{
			"mj",
			function()
				require("track").jump_to_next()
			end,
			desc = "jump to next mark",
		},
		{
			"mk",
			function()
				require("track").jump_to_prev()
			end,
			desc = "jump to prev mark",
		},
		{
			"<space>om",
			function()
				require("track").search()
			end,
			desc = "search marks",
		},
	},
}
