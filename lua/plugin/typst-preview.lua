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
			function()
				if vim.bo.filetype == "typst" then
					vim.cmd("TypstPreviewToggle")
				end
			end,
			desc = "preview typst document",
		},
	},
	ft = "typst",
}
