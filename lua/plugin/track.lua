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
	},
}
