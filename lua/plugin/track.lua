return {
	config = function()
		vim.api.nvim_set_hl(0, "TrackFlow", { fg = "#eb9007" })
		vim.api.nvim_set_hl(0, "TrackMark", { fg = "#15f700" })

		require("track").setup({
			mark = {
				mark_hl_group = "TrackMark",
			},
			outline = {
				win_pos = "right",
				flow_hl_group = "TrackFlow",
				mark_hl_group = "TrackMark",
				set_default_when_update = true,
				preview_on_hover = false,
				keymap_update = "r",
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
			"ma",
			function()
				require("track").add_mark()
			end,
			desc = "add mark",
		},
		{
			"me",
			function()
				require("track").update_mark(true)
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
			"<AC-l>",
			function()
				if require("track").is_outline_open() then
					require("track").close_outline()
				else
					require("track").open_outline(true)
				end
			end,
			desc = "open outline",
		},
		{
			"mo",
			function()
				require("track").open_outline(true)
			end,
			desc = "open outline",
		},
		{
			"mO",
			function()
				require("track").open_outline()
			end,
			desc = "select flow then open outline",
		},
		{
			"mc",
			function()
				require("track").close_outline()
			end,
			desc = "close outline",
		},
		{
			"mm",
			function()
				require("track").navigate_to_outline()
			end,
			desc = "navigate_to_outline",
		},
	},
}
