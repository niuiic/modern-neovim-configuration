local keys = {
	{
		"<leader>pt",
		function()
			require("crates").toggle()
		end,
		desc = "toggle showing crate version",
	},
	{
		"<leader>pu",
		function()
			require("crates").upgrade_crate()
		end,
		desc = "update crate",
	},
	{
		"<leader>pU",
		function()
			require("crates").upgrade_all_crates()
		end,
		desc = "update all crates",
	},
	{
		"<leader>pi",
		function()
			require("crates").show_popup()
		end,
		desc = "show crate info",
	},
	{
		"<leader>pf",
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
