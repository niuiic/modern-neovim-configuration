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
		local hls = {
			"LineNrAbove",
			"LineNr",
			"LineNrBelow",
		}
		for _, hl in ipairs(hls) do
			vim.api.nvim_set_hl(0, hl, { fg = "#16D8B5" })
		end
	end,
}
