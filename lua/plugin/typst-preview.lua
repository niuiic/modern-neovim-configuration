return {
	config = function()
		require("typst-preview").setup()
	end,
	keys = {
		{
			"<leader>P",
			function()
				require("typst-preview").preview()
			end,
			desc = "preview typst document",
		},
	},
}
