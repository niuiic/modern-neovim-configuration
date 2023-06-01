return {
	config = function()
		require("window-picker").setup({
			hint = "floating-big-letter",
			highlights = {
				winbar = {
					focused = {
						fg = "#ededed",
						bg = "#44cc41",
						bold = true,
					},
					unfocused = {
						fg = "#ededed",
						bg = "#ff23ff",
						bold = true,
					},
				},
			},
		})
	end,
	keys = {
		{
			"<space>wo",
			function()
				local winid = require("window-picker").pick_window()
				if winid then
					vim.api.nvim_set_current_win(winid)
				end
			end,
			desc = "pick window",
			silent = true,
		},
	},
}
