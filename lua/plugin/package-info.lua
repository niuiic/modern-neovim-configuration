local keys = {
	{
		"<leader>pt",
		function()
			require("package-info").toggle()
		end,
		"toggle showing package version",
	},
	{
		"<leader>pu",
		function()
			require("package-info").update()
		end,
		"update package",
	},
	{
		"<leader>pc",
		function()
			require("package-info").change_version()
		end,
		"change package version",
	},
	{
		"<leader>pd",
		function()
			require("package-info").delete()
		end,
		"delete package",
	},
	{
		"<leader>pi",
		function()
			require("package-info").install()
		end,
		"install new package",
	},
}

return {
	config = function()
		require("package-info").setup({})
	end,
	keys = keys,
	event = "BufRead package.json",
	dependencies = "MunifTanjim/nui.nvim",
}
