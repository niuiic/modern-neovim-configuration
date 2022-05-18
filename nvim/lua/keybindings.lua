vim.g.mapleader = "\\"
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
local status, which_key = pcall(require, "which-key")
if not status then
	vim.notify("not found which-key")
	return
end
local register = which_key.register

-- unmap
map("n", "<leader>b", "", opt)

-- esc
map("i", "<C-c>", "<esc>", opt)

-- exit and refresh
map("n", "<C-x>", ":bd<CR>", opt)
map("n", "<C-q>", ":q<CR>", opt)
map("n", "<A-q>", ":q!<CR>", opt)
map("n", "<C-n>", ":only<CR>", opt)
map("n", "<C-e>", ":e<CR>", opt)

-- save
map("n", "<C-s>", ":w!<CR>", opt)
map("n", "<A-s>", ":wa!<CR>", opt)

-- split windows
register({
	s = {
		name = "split windows",
		h = {
			"<cmd>sp<CR>",
			"split window horizontally",
		},
		v = {
			"<cmd>vsp<CR>",
			"split window vertically",
		},
		p = {
			"<cmd>CocCommand volar.action.splitEditors<CR>",
			"split vue file",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})

-- bufferline
map("n", "<C-k>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-j>", ":BufferLineCyclePrev<CR>", opt)
register({
	b = {
		name = "bufferline",
		p = {
			"<cmd>BufferLineMovePrev<CR>",
			"move current tab to previous position",
		},
		n = {
			"<cmd>BufferLineMoveNext<CR>",
			"move current tab to next position",
		},
		e = {
			"<cmd>BufferLineSortByExtension<CR>",
			"sort tabs by extension",
		},
		d = {
			"<cmd>BufferLineSortByExtension<CR>",
			"sort tabs by directory",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})

-- format
map("n", "<AC-l>", ":lua vim.lsp.buf.format()<CR>", opt)

-- coc-explorer
register({
	p = {
		"<cmd>CocCommand explorer --quit-on-open<CR>",
		"toggle file tree",
	},
}, {
	mode = "n",
	prefix = "<leader>",
})

-- quickfix
register({
	q = {
		name = "quickfix",
		s = {
			"set compile cmd",
		},
		o = {
			"<cmd>cope25<CR>",
			"open quickfix window",
		},
		m = {
			"<cmd>make<CR>",
			"make",
		},
		c = {
			"<cmd>cclose<CR>",
			"close quickfix window",
		},
		e = {
			"<cmd>set modifiable<CR>",
			"set quickfix list modifiable",
		},
		w = {
			"<cmd>write! build.log<CR>",
			"save quickfix list",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
map("n", "<localleader>qs", ":set makeprg= ", opt)
map("n", "<A-j>", ":cnext<CR>", opt)
map("n", "<A-k>", ":cprev<CR>", opt)
map("n", "<A-g>", ":cfirst<CR>", opt)
map("n", "<A-G>", ":clast<CR>", opt)

-- telescope
register({
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
			"<cmd>Telescope fd<CR>",
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
			function()
				vim.fn.systemlist("ctags -R")
				require("telescope.builtin").current_buffer_tags()
			end,
			"search tags in current buffer",
		},
		w = {
			"<cmd>Telescope current_buffer_fuzzy_find<CR>",
			"search words in current buffer",
		},
		p = {
			"<cmd>Telescope projects<CR>",
			"search projects",
		},
		g = {
			name = "global search",
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
