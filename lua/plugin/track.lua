return {
	config = function()
		vim.api.nvim_set_hl(0, "TrackFlow", { fg = "#eb9007" })
		vim.api.nvim_set_hl(0, "TrackMark", { fg = "#15f700" })

		require("track").setup({
			mark = {
				mark_hl_group = "TrackMark",
			},
			outline = {
				flow_hl_group = "TrackFlow",
				mark_hl_group = "TrackMark",
			},
		})
	end,
	keys = {
		{
			"mf",
			function()
				require("track").add_flow()
			end,
			desc = "add flow",
		},
		{
			"mm",
			function()
				require("track").add_mark()
			end,
			desc = "add mark",
		},
		{
			"me",
			function()
				require("track").update_mark()
			end,
			desc = "update mark",
		},
		{
			"mE",
			function()
				require("track").update_flow()
			end,
			desc = "update flow",
		},
		{
			"md",
			function()
				require("track").delete_mark()
			end,
			desc = "delete mark",
		},
		{
			"mD",
			function()
				require("track").delete_marks()
			end,
			desc = "delete flow",
		},
		{
			"mo",
			function()
				require("track").open_outline(true)
			end,
			desc = "open outline",
		},
		{
			"mc",
			function()
				require("track").close_outline()
			end,
			desc = "close outline",
		},
	},
}
