local config = function()
	require("gitsigns").setup({
		signcolumn = false,
		numhl = true,
		preview_config = {
			border = "rounded",
		},
	})
end

local keys = {
	{ "<space>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "reset hunk" },
	{
		"<space>gp",
		function()
			package.loaded.gitsigns.preview_hunk()
		end,
		desc = "preview hunk",
	},
	{
		"<space>gl",
		"<cmd>Gitsigns setloclist<cr>",
		desc = "list all stage hunks in buffer",
	},
	{
		"<space>gL",
		"<cmd>Gitsigns setloclist all<cr>",
		desc = "list all stage hunks in project",
	},
}

return {
	config = config,
	keys = keys,
	event = "BufRead",
}
