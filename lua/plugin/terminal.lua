return {
	config = function()
		require("terminal").setup({
			on_term_opened = function(bufnr)
				require("terminal.utils").set_buf_options()

				vim.api.nvim_buf_set_keymap(bufnr, "t", "<C-x>", "", {
					callback = function()
						vim.api.nvim_buf_delete(bufnr, {
							force = true,
						})
					end,
				})

				vim.api.nvim_buf_set_keymap(bufnr, "t", "<C-k>", "", {
					callback = function()
						vim.cmd("BufferLineCycleNext")
					end,
				})

				vim.api.nvim_buf_set_keymap(bufnr, "t", "<C-j>", "", {
					callback = function()
						vim.cmd("BufferLineCyclePrev")
					end,
				})

				vim.api.nvim_buf_set_keymap(bufnr, "t", "<space>bo", "", {
					callback = function()
						vim.cmd("BufferLinePick")
					end,
				})
			end,
		})
	end,
	keys = {
		{
			"<C-z>",
			function()
				require("terminal").open()
			end,
			desc = "open terminal",
		},
	},
}
