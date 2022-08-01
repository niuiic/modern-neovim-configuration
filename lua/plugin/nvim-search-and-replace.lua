local utils = require("utils")

utils.fn.require("nvim-search-and-replace").setup({
	-- file patters to ignore
	ignore = {
		"**/node_modules/**",
		"**/.git/**",
		"**/.gitignore",
		"**/.gitmodules",
		"build/**",
		"package.*",
		"yarn.*",
	},
	-- save the changes after replace
	update_changes = false,
	-- keymap for search and replace
	replace_keymap = "<leader>rr",
	-- keymap for search and replace ( this does not care about ignored files )
	replace_all_keymap = "<leader>rR",
	-- keymap for search and replace
	replace_and_save_keymap = "<leader>rs",
	-- keymap for search and replace ( this does not care about ignored files )
	replace_all_and_save_keymap = "<leader>rS",
})

-- keymap
utils.fn.whichKeyMap({
	r = {
		name = "replace in project",
		r = {
			"replace",
		},
		R = {
			"replace includes ignored files",
		},
		s = {
			"replace and save",
		},
		S = {
			"replace and save includes ignored files",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
