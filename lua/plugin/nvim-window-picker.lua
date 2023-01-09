return {
	config = function()
		require("window-picker").setup({
			use_winbar = "always",
			other_win_hl_color = "#ff23ff",
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
