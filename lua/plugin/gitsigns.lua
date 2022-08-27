local utils = require("utils")

local gitsigns = utils.fn.require("gitsigns")

gitsigns.setup()

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
