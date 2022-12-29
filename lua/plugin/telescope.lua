local utils = require("utils")

local telescope = require("telescope")
local trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<Esc>"] = "close",
				["<C-b>"] = "preview_scrolling_up",
				["<C-f>"] = "preview_scrolling_down",
				["<C-u>"] = "results_scrolling_up",
				["<C-d>"] = "results_scrolling_down",
				["<c-o>"] = trouble.open_with_trouble,
			},
			n = { ["<c-o>"] = trouble.open_with_trouble },
		},
		layout_config = {
			vertical = { width = 0.8 },
		},
	},
	pickers = {},
	extensions = {},
})

-- keymap
local opt = {
	hidden = true,
	search_dirs = {
		require("utils").fn.root_pattern(),
	},
}

local telescope_builtin = require("telescope.builtin")

-- some search functions will respect .gitignore
require("which-key").register({
	o = {
		name = "telescope",
		l = {
			"<cmd>Telescope<CR>",
			"open telescope list",
		},
		b = {
			"<cmd>Telescope buffers<CR>",
			"search buffer with preview",
		},
		c = {
			name = "command",
			c = {
				"<cmd>Telescope commands<CR>",
				"search command",
			},
			h = {
				"<cmd>Telescope command_history<CR>",
				"search command history",
			},
		},
		f = {
			function()
				telescope_builtin.find_files(opt)
			end,
			"search files in workspace",
		},
		N = {
			"<cmd>Telescope help_tags<CR>",
			"search neovim documents",
		},
		n = {
			"<cmd>Noice telescope<CR>",
			"search notifications",
		},
		h = {
			"<cmd>Telescope oldfiles<CR>",
			"search history files",
		},
		s = {
			"<cmd>Telescope git_status<CR>",
			"search git status",
		},
		m = {
			"<cmd>ReachOpen marks<CR>",
			"search marks",
		},
		M = {
			"<cmd>Telescope marks<CR>",
			"search marks with preview",
		},
		t = {
			"<cmd>Telescope treesitter<CR>",
			"search tags",
		},
		w = {
			"<cmd>Telescope current_buffer_fuzzy_find<CR>",
			"search words in current buffer",
		},
		r = {
			"<cmd>Telescope resume<CR>",
			"research",
		},
		T = {
			"<cmd>TodoTelescope<CR>",
			"search keywords(TODO, FIXME, etc) in the project",
		},
		p = {
			"<cmd>Telescope projects<CR>",
			"search projects",
		},
		y = {
			"<cmd>Telescope yank_history<CR>",
			"yank history",
		},
		g = {
			name = "global",
			w = {
				function()
					telescope_builtin.live_grep(opt)
				end,
				"search words globally",
			},
			t = {
				function()
					vim.fn.systemlist("ctags -R")
					telescope_builtin.tags(opt)
				end,
				"search tags globally",
			},
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
