local config = function()
	local gitsigns = require("gitsigns")

	gitsigns.setup({})

	require("which-key").register({
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
					package.loaded.gitsigns.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			map("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					package.loaded.gitsigns.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })
		end,
	})
end

local keys = {
	{ "<space>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "stage hunk" },
	{ "<space>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "reset hunk" },
	{
		"<space>gR",
		function()
			package.loaded.gitsigns.reset_buffer()
		end,
		desc = "reset buffer",
	},
	{
		"<space>gu",
		function()
			package.loaded.gitsigns.undo_stage_hunk()
		end,
		desc = "undo stage hunk",
	},
	{
		"<space>gp",
		function()
			package.loaded.gitsigns.preview_hunk()
		end,
		desc = "preview hunk",
	},
	{
		"<space>gd",
		function()
			package.loaded.gitsigns.toggle_deleted()
		end,
		desc = "toggle deleted",
	},
	{
		"<space>gD",
		function()
			package.loaded.gitsigns.diffthis()
		end,
		desc = "diff this",
	},
	{
		"<space>gS",
		function()
			package.loaded.gitsigns.stage_buffer()
		end,
		desc = "stage buffer",
	},
	{
		"<space>gb",
		function()
			package.loaded.gitsigns.toggle_current_line_blame()
		end,
		desc = "toggle current line blame",
	},
	{
		"<space>gB",
		function()
			package.loaded.gitsigns.blame_line({ full = true })
		end,
		desc = "blame line",
	},
	{
		"<space>gi",
		"<cmd>Gitsigns select_hunk<CR>",
		desc = "select hunk",
	},
	-- trouble.nvim is required
	{
		"<space>gl",
		"<cmd>Gitsigns setqflist<CR>",
		desc = "list all stage hunks in buffer",
	},
	{
		"<space>gL",
		"<cmd>Gitsigns setqflist all<CR>",
		desc = "list all stage hunks in project",
	},
}

return {
	config = config,
	keys = keys,
	event = "VimEnter",
}
