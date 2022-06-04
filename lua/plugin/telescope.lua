local utils = require("utils")

utils.fn.require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<Esc>"] = "close",
			},
		},
	},
	pickers = {},
	extensions = {},
})

-- keymap
local opt = {
	hidden = true,
	search_dirs = {
		require("utils").fn.getRootPath(),
	},
}

local telescope_builtin = utils.fn.require("telescope.builtin")

utils.fn.whichKeyMap({
	o = {
		name = "telescope",
		l = {
			"<cmd>Telescope<CR>",
			"open telescope list",
		},
		b = {
			"<cmd>Telescope buffers<CR>",
			"search buffer",
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
		q = {
			"<cmd>Telescope quickfix<CR>",
			"search quickfix",
		},
		n = {
			"<cmd>Telescope help_tags<CR>",
			"search neovim documents",
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
			"<cmd>Telescope marks<CR>",
			"search marks",
		},
		t = {
			"<cmd>Telescope treesitter<CR>",
			"search tags",
		},
		w = {
			"<cmd>Telescope current_buffer_fuzzy_find<CR>",
			"search words in current buffer",
		},
		k = {
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
