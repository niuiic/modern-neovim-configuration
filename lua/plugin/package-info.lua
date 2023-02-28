local keys = {
	{
		"<leader>pnt",
		function()
			require("package-info").toggle()
		end,
		desc = "toggle showing package version",
	},
	{
		"<leader>pnu",
		function()
			require("package-info").update()
		end,
		desc = "update package",
	},
	{
		"<leader>pnc",
		function()
			require("package-info").change_version()
		end,
		desc = "change package version",
	},
	{
		"<leader>pnd",
		function()
			require("package-info").delete()
		end,
		desc = "delete package",
	},
	{
		"<leader>pni",
		function()
			require("package-info").install()
		end,
		desc = "install new package",
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
