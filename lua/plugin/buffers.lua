return {
	config = function()
		require("buffers").setup({
			enable = function(bufnr)
				local disabled_filetypes = { "NvimTree", "smear-cursor", "notify", "noice", "", "buffers", "track" }

				local filetype = vim.filetype.match({ filename = vim.api.nvim_buf_get_name(bufnr) })
					or vim.api.nvim_get_option_value("filetype", { buf = bufnr })

				return filetype
					and not vim.tbl_contains(disabled_filetypes, filetype)
					and not filetype:find("blink")
					and not filetype:find("dapui")
			end,
			window = { width = 80 },
		})
	end,
	keys = {
		{
			"<C-b>",
			function()
				require("buffers").open()
			end,
		},
	},
	lazy = false,
}
