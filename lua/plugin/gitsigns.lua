local config = function()
	require("gitsigns").setup({})
end

local keys = {
	{ "<space>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "stage hunk" },
	{ "<space>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "reset hunk" },
	{ "<space>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "stage hunk", mode = "v" },
	{ "<space>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "reset hunk", mode = "v" },
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
		"<space>gD",
		function()
			package.loaded.gitsigns.toggle_deleted()
		end,
		desc = "toggle deleted",
	},
	{
		"<space>gd",
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
		"<space>gB",
		function()
			package.loaded.gitsigns.toggle_current_line_blame()
		end,
		desc = "toggle current line blame",
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
	event = "BufRead",
}
