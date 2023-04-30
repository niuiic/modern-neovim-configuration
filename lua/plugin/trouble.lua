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
			toggle_fold = { "z" },
			previous = "k",
			next = "j",
		},
		auto_close = true,
		padding = false,
	})
end

local keys = {
	{ "<leader>td", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "open diagnostics" },
	{ "<leader>tl", "<cmd>TroubleToggle loclist<CR>", desc = "open loclist" },
	{ "<leader>tf", "<cmd>TroubleToggle lsp_references<CR>", desc = "open lsp references list" },
	{ "<leader>tt", "<cmd>TodoTrouble<CR>", desc = "search keywords(TODO, FIXME, etc) in the project" },
}

return {
	config = config,
	keys = keys,
	dependencies = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
}
