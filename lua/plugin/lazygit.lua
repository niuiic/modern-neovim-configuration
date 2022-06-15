-- transparency of floating window
vim.g.lazygit_floating_window_winblend = 0
-- scaling factor for floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9
-- customize lazygit popup window corner characters
vim.g.lazygit_floating_window_corner_chars = { "╭", "╮", "╰", "╯" }
-- use plenary.nvim to manage floating window if available
vim.g.lazygit_floating_window_use_plenary = 0
-- fallback to 0 if neovim-remote is not installed
vim.g.lazygit_use_neovim_remote = 0

local utils = require("utils")

-- keymap
utils.fn.whichKeyMap({
	g = {
		"<cmd>LazyGit<CR>",
		"lazygit",
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
