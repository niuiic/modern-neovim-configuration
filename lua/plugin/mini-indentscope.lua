return {
	config = function()
		require("mini.indentscope").setup()
		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				if vim.bo.filetype == "terminal" then
					vim.b.miniindentscope_disable = true
				end
			end,
		})
	end,
}
