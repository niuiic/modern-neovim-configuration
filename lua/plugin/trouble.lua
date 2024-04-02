local config = function()
	require("trouble").setup({
		keys = {
			j = "next",
			k = "prev",
			Z = "fold_toggle",
		},
	})
end

local keys = {
	{ "<space>lo", "<cmd>Trouble symbols toggle<CR>", desc = "toggle symbols" },
}

return {
	config = config,
	keys = keys,
	dependencies = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
	branch = "dev",
}
