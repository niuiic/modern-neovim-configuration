local config = function()
	require("trouble").setup({
		modes = {
			quickfix = {
				win = {
					type = "split",
					position = "bottom",
					relative = "editor",
					size = { height = (vim.opt.lines:get() - vim.opt.cmdheight:get()) / 2 },
				},
			},
			symbols = {
				win = {
					type = "split",
					position = "right",
					relative = "editor",
					size = { width = 50 },
				},
			},
		},
		keys = {
			j = "next",
			k = "prev",
			Z = "fold_toggle",
		},
	})
end

local keys = {
	{
		"<space>lo",
		function()
			require("trouble").toggle("symbols")
		end,
		desc = "toggle symbols",
	},
	{
		"<A-j>",
		function()
			pcall(require("trouble").next, { skip_groups = true, jump = true })
		end,
		desc = "jump to next item",
	},
	{
		"<A-k>",
		function()
			pcall(require("trouble").prev, { skip_groups = true, jump = true })
		end,
		desc = "jump to previous item",
	},
}

return {
	config = config,
	keys = keys,
	dependencies = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
	branch = "dev",
}
