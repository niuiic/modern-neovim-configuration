local config = function()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "tokyonight",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			disabled_filetypes = {
				"NvimTree",
				"toggleterm",
				"Trouble",
				"spectre_panel",
				"OverseerList",
				"divider",
			},
			always_divide_middle = true,
			globalstatus = false,
		},
		sections = {
			lualine_a = { "filename" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_x = { "encoding", "filetype", "filesize" },
			lualine_y = { "progress", "location" },
			lualine_z = { 'os.date("%H:%M:%S", os.time())' },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
		theme = "auto",
	})

	-- Trigger rerender of status line every second for clock
	if _G.Statusline_timer == nil then
		_G.Statusline_timer = vim.loop.new_timer()
	else
		_G.Statusline_timer:stop()
	end
	_G.Statusline_timer:start(
		0,
		1000,
		vim.schedule_wrap(function()
			vim.cmd("redrawstatus")
		end)
	)
end

return {
	config = config,
	dependencies = {
		"folke/tokyonight.nvim",
		"kyazdani42/nvim-web-devicons",
	},
}
