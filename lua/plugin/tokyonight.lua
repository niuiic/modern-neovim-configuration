local utils = require("utils")

utils.fn.require("tokyonight").setup({
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})

vim.cmd([[colorscheme tokyonight-storm]])

-- highlight line number
vim.api.nvim_set_hl(0, "LineNr", { fg = "#00ffff" })