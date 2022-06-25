local utils = require("utils")

local gitsigns = utils.fn.require("gitsigns")

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})

local gs = package.loaded.gitsigns

-- keymap
utils.fn.map("n", "gc", ":!git commit -m ", utils.var.opt)

utils.fn.whichKeyMap({
	g = {
		name = "git signs",
		c = {
			"git commit",
		},
		s = {
			"<cmd>Gitsigns stage_hunk<CR>",
			"stage hunk",
		},
		r = {
			"<cmd>Gitsigns reset_hunk<CR>",
			"reset hunk",
		},
		R = {
			function()
				gs.reset_buffer()
			end,
			"reset buffer",
		},
		u = {
			function()
				gs.undo_stage_hunk()
			end,
			"undo stage hunk",
		},
		p = {
			function()
				gs.preview_hunk()
			end,
			"preview hunk",
		},
		d = {
			function()
				gs.toggle_deleted()
			end,
			"toggle deleted",
		},
		D = {
			function()
				gs.diffthis()
			end,
			"diff this",
		},
		S = {
			function()
				gs.stage_buffer()
			end,
			"stage buffer",
		},
		b = {
			function()
				gs.toggle_current_line_blame()
			end,
			"toggle current line blame",
		},
		B = {
			function()
				gs.blame_line({ full = true })
			end,
			"blame line",
		},
		i = {
			"<cmd>Gitsigns select_hunk<CR>",
			"select hunk",
		},
		-- trouble.nvim is required
		l = {
			"<cmd>Gitsigns setqflist<CR>",
			"list all stage hunks in buffer",
		},
		L = {
			"<cmd>Gitsigns setqflist all<CR>",
			"list all stage hunks in project",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})

utils.fn.whichKeyMap({
	g = {
		name = "git signs",
		s = {
			"<cmd>Gitsigns stage_hunk<CR>",
			"stage hunk",
		},
		r = {
			"<cmd>Gitsigns reset_hunk<CR>",
			"reset hunk",
		},
	},
}, {
	mode = "v",
	prefix = "<localleader>",
})

gitsigns.setup({
	on_attach = function(bufnr)
		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })
	end,
})
