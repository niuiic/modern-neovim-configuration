return {
	config = function()
		require("buffers").setup({
			enable = function(bufnr)
				local disabled_filetypes = { "NvimTree", "smear-cursor", "notify", "noice", "", "buffers" }

				local filetype = vim.filetype.match({ filename = vim.api.nvim_buf_get_name(bufnr) })

				return filetype and not vim.tbl_contains(disabled_filetypes, filetype)
			end,
		})
	end,
	keys = {
		{
			"<C-g>",
			function()
				require("buffers").open()
			end,
		},
	},
}
