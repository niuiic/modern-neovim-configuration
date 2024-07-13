local config = function()
	require("gitsigns").setup({
		signcolumn = false,
		numhl = true,
	})
end

local keys = {
	{ "<space>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "stage hunk" },
	{ "<space>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "reset hunk" },
	{ "<space>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "stage hunk", mode = "v" },
	{ "<space>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "reset hunk", mode = "v" },
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
		"<cmd>Gitsigns select_hunk<cr>",
		desc = "select hunk",
	},
	-- trouble.nvim is required
	{
		"<space>gl",
		"<cmd>Gitsigns setqflist<cr>",
		desc = "list all stage hunks in buffer",
	},
	{
		"<space>gL",
		"<cmd>Gitsigns setqflist all<cr>",
		desc = "list all stage hunks in project",
	},
}

return {
	config = config,
	keys = keys,
	event = "BufRead",
}
