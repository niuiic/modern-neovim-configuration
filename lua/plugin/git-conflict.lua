local keys = {
	{ "<space>cc", "<cmd>GitConflictChooseOurs<CR>", desc = "select current changes" },
	{ "<space>ci", "<cmd>GitConflictChooseTheirs<CR>", desc = "select incoming changes" },
	{ "<space>cb", "<cmd>GitConflictChooseBoth<CR>", desc = "select both changes" },
	{ "<space>cn", "<cmd>GitConflictChooseNone<CR>", desc = "select none changes" },
	{ "<space>cj", "<cmd>GitConflictNextConflict<CR>", desc = "move to the next conflict" },
	{ "<space>ck", "<cmd>GitConflictPrevConflict<CR>", desc = "move to the previous conflict" },
	{ "<space>cl", "<cmd>GitConflictListQf<CR>", desc = "get all conflict to quickfix" },
}

return {
	config = function()
		require("git-conflict").setup({
			default_mappings = false,
		})
	end,
	keys = keys,
	event = "VimEnter",
}
