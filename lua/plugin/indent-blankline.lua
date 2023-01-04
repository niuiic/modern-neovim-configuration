local config = function()
	vim.opt.termguicolors = true
	vim.cmd([[highlight IndentBlanklineIndent1 guifg=#0066ff gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent3 guifg=#00ff00 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent4 guifg=#ff00ff gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent6 guifg=#996633 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent7 guifg=#ffff00 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent8 guifg=#000066 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent9 guifg=#00ffff gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent10 guifg=#666699 gui=nocombine]])

	require("indent_blankline").setup({
		space_char_blankline = " ",
		char_highlight_list = {
			"IndentBlanklineIndent1",
			"IndentBlanklineIndent2",
			"IndentBlanklineIndent3",
			"IndentBlanklineIndent4",
			"IndentBlanklineIndent5",
			"IndentBlanklineIndent6",
			"IndentBlanklineIndent7",
			"IndentBlanklineIndent8",
			"IndentBlanklineIndent9",
			"IndentBlanklineIndent10",
		},
	})

	require("indent_blankline").setup({
		space_char_blankline = " ",
	})

	local special_indent_width = {
		vue = 2,
		javascript = 2,
		typescript = 2,
		html = 2,
		css = 2,
		scss = 2,
		javascriptreact = 2,
		typescriptreact = 2,
	}

	vim.api.nvim_create_autocmd("BufEnter", {
		pattern = "*",
		callback = function()
			for k, v in pairs(special_indent_width) do
				if vim.bo.filetype == k then
					vim.opt.tabstop = v
					vim.opt.shiftwidth = v
				end
			end
		end,
	})
end

return {
	config = config,
}
