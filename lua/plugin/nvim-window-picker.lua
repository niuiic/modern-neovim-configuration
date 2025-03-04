return {
	keys = {
		{
			"<C-n>",
			function()
				local winid = require("window-picker").pick_window({
					picker_config = {
						statusline_winbar_picker = {
							use_winbar = "always",
						},
					},
					show_prompt = false,
					filter_rules = {
						bo = {
							filetype = { "NvimTree", "notify", "noice" },
							buftype = { "terminal" },
						},
					},
				})
				if winid then
					vim.api.nvim_set_current_win(winid)
				end
			end,
		},
	},
}
