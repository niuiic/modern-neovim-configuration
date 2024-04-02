local config = function()
	require("trouble").setup({
		action_keys = {
			close = "q",
			cancel = "<esc>",
			refresh = "r",
			jump = { "<cr>" },
			open_split = { "<c-h>" },
			open_vsplit = { "<c-v>" },
			open_tab = { "<c-t>" },
			jump_close = { "o" },
			toggle_mode = "m",
			toggle_preview = "t",
			hover = "K",
			preview = "p",
			close_folds = { "zm" },
			open_folds = { "zr" },
			toggle_fold = { "Z" },
			previous = "k",
			next = "j",
		},
		auto_close = true,
		padding = false,
	})
end

local keys = {
	{ "<space>lo", "<cmd>Trouble symbols toggle<CR>", desc = "toggle symbols" },
	{ "<space>qo", "<cmd>Trouble qflist toggle focus=true<CR>", desc = "toggle quickfix" },
}

return {
	config = config,
	keys = keys,
	dependencies = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
	branch = "dev",
}
