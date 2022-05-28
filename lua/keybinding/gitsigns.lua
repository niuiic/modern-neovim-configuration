local utils = require("utils")
local gs = package.loaded.gitsigns

utils.fn.mapRegister({
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
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})

utils.fn.mapRegister({
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
		i = {
			"<cmd>Gitsigns select_hunk<CR>",
			"select hunk",
		},
	},
}, {
	mode = "v",
	prefix = "<localleader>",
})

require("gitsigns").setup({
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
