utils = require("utils")

utils.fn.mapRegister({
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
				require("telescope.builtin").find_files({
					hidden = true,
					search_dirs = {
						require("utils").fn.getWorkspacePath(),
					},
				})
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
		g = {
			w = {
				"<cmd>Telescope live_grep<CR>",
				"search words globally",
			},
			t = {
				function()
					vim.fn.systemlist("ctags -R")
					require("telescope.builtin").tags()
				end,
				"search tags globally",
			},
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
