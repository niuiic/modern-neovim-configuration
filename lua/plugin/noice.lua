local config = function()
	vim.notify = require("notify")
	require("notify").setup({ timeout = 1 })

	require("noice").setup({
		messages = {
			view = "mini",
		},
		views = {
			mini = {
				win_options = {
					winblend = 0,
				},
			},
		},
		lsp = {
			signature = {
				enabled = false,
			},
		},
		presets = {
			lsp_doc_border = true,
		},
	})

	vim.api.nvim_set_hl(0, "NoiceFormatProgressTodo", { fg = "#262728" })
	vim.api.nvim_set_hl(0, "NoiceFormatProgressDone", { bg = "#00ffff" })
end

return {
	config = config,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	event = "VimEnter",
}
