local terms = {}

local set_keymap = function(bufnr)
	local modes = { "t", "n" }

	for _, mode in ipairs(modes) do
		vim.api.nvim_buf_set_keymap(bufnr, mode, "<C-z>", "", {
			callback = function()
				require("terminal").open()
			end,
		})

		vim.api.nvim_buf_set_keymap(bufnr, mode, "<C-x>", "", {
			callback = function()
				vim.uv.kill(terms[bufnr], "sigkill")
				table.remove(terms, bufnr)
				vim.api.nvim_buf_delete(bufnr, {
					force = true,
				})
			end,
		})

		vim.api.nvim_buf_set_keymap(bufnr, mode, "<C-b>", "", {
			callback = function()
				require("buffers").open()
			end,
		})

		vim.api.nvim_buf_set_keymap(bufnr, mode, "<C-q>", "", {
			callback = function()
				vim.cmd("Quit")
			end,
		})

		vim.api.nvim_buf_set_keymap(bufnr, mode, "<esc>", "", {
			callback = function()
				vim.cmd("stopinsert")
			end,
		})
	end
end

return {
	config = function()
		require("terminal").setup({
			on_term_opened = function(bufnr, pid)
				vim.api.nvim_set_option_value("filetype", "terminal", { buf = bufnr })

				set_keymap(bufnr)

				terms[bufnr] = pid
			end,
		})

		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				vim.schedule(function()
					if vim.bo.filetype == "terminal" then
						vim.cmd("startinsert")
					end
				end)
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
