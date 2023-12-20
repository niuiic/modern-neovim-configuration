return {
	config = function()
		require("typst-preview").setup({
			get_root = require("core").file.root_path,
		})
	end,
	build = function()
		require("typst-preview").update()
	end,
	keys = {
		{
			"<leader>p",
			"<cmd>TypstPreviewToggle<CR>",
			desc = "preview typst document",
		},
	},
	ft = "typst",
}
