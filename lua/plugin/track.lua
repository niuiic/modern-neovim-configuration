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
				set_default_when_update_mark = true,
				preview_on_hover = false,
				get_mark_line_text = function(_, _, text)
					local space, content = string.match(text, "([%s]*)(.*)")
					return space .. "- " .. content
				end,
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
