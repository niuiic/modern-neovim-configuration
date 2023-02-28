local keys = {
	{
		"<leader>prt",
		function()
			require("crates").toggle()
		end,
		desc = "toggle showing crate version",
	},
	{
		"<leader>pru",
		function()
			require("crates").upgrade_crate()
		end,
		desc = "update crate",
	},
	{
		"<leader>prU",
		function()
			require("crates").upgrade_all_crates()
		end,
		desc = "update all crates",
	},
	{
		"<leader>pri",
		function()
			require("crates").show_popup()
		end,
		desc = "show crate info",
	},
	{
		"<leader>prf",
		function()
			require("crates").show_features_popup()
		end,
		desc = "show crate features",
	},
}

return {
	config = function()
		require("crates").setup({})
	end,
	keys = keys,
	event = "BufRead Cargo.toml",
	dependencies = { "nvim-lua/plenary.nvim" },
}
