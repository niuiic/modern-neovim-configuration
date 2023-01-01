return {
	config = function()
		require("nvim-ts-autotag").setup({
			filetypes = { "html", "xml", "vue" },
		})
	end,
}
