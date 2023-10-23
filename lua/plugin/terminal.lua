local set_line_number = function(show_line_number)
	local options = {
		"number",
		"relativenumber",
	}
	for _, option in ipairs(options) do
		vim.api.nvim_set_option_value(option, show_line_number, {
			win = 0,
		})
	end
end

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
				vim.api.nvim_buf_delete(bufnr, {
					force = true,
				})
			end,
		})

		vim.api.nvim_buf_set_keymap(bufnr, mode, "<C-k>", "", {
			callback = function()
				vim.cmd("BufferLineCycleNext")
			end,
		})

		vim.api.nvim_buf_set_keymap(bufnr, mode, "<C-j>", "", {
			callback = function()
				vim.cmd("BufferLineCyclePrev")
			end,
		})

		vim.api.nvim_buf_set_keymap(bufnr, mode, "<space>bh", "", {
			callback = function()
				vim.cmd("BufferLineMovePrev")
			end,
		})

		vim.api.nvim_buf_set_keymap(bufnr, mode, "<space>bl", "", {
			callback = function()
				vim.cmd("BufferLineMoveNext")
			end,
		})

		vim.api.nvim_buf_set_keymap(bufnr, mode, "<space>bo", "", {
			callback = function()
				vim.cmd("BufferLinePick")
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
		local term_win = 0

		require("terminal").setup({
			on_term_opened = function(bufnr)
				vim.api.nvim_set_option_value("filetype", "terminal", {
					buf = bufnr,
				})

				term_win = vim.api.nvim_get_current_win()

				set_line_number(false)

				set_keymap(bufnr)
			end,
		})

		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			pattern = { "*" },
			callback = function(args)
				local filetype = vim.api.nvim_get_option_value("filetype", {
					buf = args.buf,
				})

				if filetype == "terminal" then
					vim.cmd("startinsert")
				end

				if vim.api.nvim_get_current_win() == term_win then
					set_line_number(filetype ~= "terminal")
				end
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
