require("pretty-fold").setup({
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
		-- "@brief%s*", -- (for C++) Remove '@brief' and all spaces after.
	},
	add_close_pattern = true, -- true, 'last_line' or false
	-- same feature to matchup, no need to set
	matchup_patterns = {
		-- { "{", "}" },
		-- { "%(", ")" }, -- % to escape lua pattern char
		-- { "%[", "]" }, -- % to escape lua pattern char
	},
	ft_ignore = { "markdown" },
})

require("pretty-fold.preview").setup({
	default_keybindings = false, -- Set to false to disable default keybindings
	-- 'none', "single", "double", "rounded", "solid", 'shadow' or table
	-- For explanation see: :help nvim_open_win()
	border = { " ", "", " ", " ", " ", " ", " ", " " },
})
