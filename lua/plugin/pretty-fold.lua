local utils = require("utils")

utils.fn.require("pretty-fold").setup({
	sections = {
		left = {
			"content",
		},
		right = {
			" ",
			"number_of_folded_lines",
			": ",
			"percentage",
			" ",
			function(config)
				return config.fill_char:rep(3)
			end,
		},
	},
	fill_char = "•",

	remove_fold_markers = true,

	-- Keep the indentation of the content of the fold string.
	keep_indentation = true,

	-- Possible values:
	-- "delete" : Delete all comment signs from the fold string.
	-- "spaces" : Replace all comment signs with equal number of spaces.
	-- false    : Do nothing with comment signs.
	process_comment_signs = "spaces",

	-- Comment signs additional to the value of `&commentstring` option.
	comment_signs = {},

	-- List of patterns that will be removed from content foldtext section.
	stop_words = {
		"@brief%s*", -- (for C++) Remove '@brief' and all spaces after.
	},

	add_close_pattern = true, -- true, 'last_line' or false

	matchup_patterns = {
		{ "{", "}" },
		{ "%(", ")" }, -- % to escape lua pattern char
		{ "%[", "]" }, -- % to escape lua pattern char
	},

	ft_ignore = { "neorg" },
})

local foldPreview = utils.fn.require("fold-preview")
foldPreview.setup({
	border = "single",
})

local keymap = vim.keymap
keymap.amend = utils.fn.require("keymap-amend")
local map = foldPreview.mapping

keymap.amend("n", "h", foldPreview.show_preview)
keymap.amend("n", "l", map.close_preview_open_fold)
keymap.amend("n", "zo", map.close_preview)
keymap.amend("n", "zO", map.close_preview)
keymap.amend("n", "zc", map.close_preview_without_defer)
keymap.amend("n", "zR", map.close_preview)
keymap.amend("n", "zM", map.close_preview_without_defer)
