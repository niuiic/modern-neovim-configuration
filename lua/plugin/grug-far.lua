return {
	config = function()
		require("grug-far").setup({
			keymaps = {
				replace = { n = "R" },
				qflist = { n = "Q" },
				syncLocations = { n = "" },
				syncLine = { n = "r" },
				close = { n = "" },
				historyOpen = { n = "H" },
				historyAdd = { n = "" },
				refresh = { n = "" },
				gotoLocation = { n = "<cr>" },
				pickHistoryEntry = { n = "<cr>" },
				abort = { n = "" },
			},
		})
	end,
	keys = {
		{
			"R",
			function()
				require("grug-far").open()
			end,
			desc = "replace in project",
			mode = "n",
		},
	},
}
