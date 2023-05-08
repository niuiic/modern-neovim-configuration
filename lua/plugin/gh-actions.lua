return {
	config = function()
		require("gh-actions").setup({
			split = {
				size = 40,
			},
		})
	end,
	keys = {
		{ "<space>gh", ":GhActions<CR>", desc = "github actions" },
	},
	build = "make",
	dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
}
