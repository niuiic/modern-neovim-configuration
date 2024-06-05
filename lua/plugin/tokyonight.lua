return {
	config = function()
		require("tokyonight").setup({
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})

		vim.cmd("colorscheme tokyonight-storm")

		-- highlight line number
		require("core").lua.list.each({
			"LineNrAbove",
			"LineNr",
			"LineNrBelow",
		}, function(hl)
			vim.api.nvim_set_hl(0, hl, { fg = "#16D8B5" })
		end)
	end,
}
