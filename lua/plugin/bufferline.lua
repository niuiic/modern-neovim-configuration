require("bufferline").setup({
	options = {
		mode = "buffers",
		numbers = "ordinal",
		indicator = { icon = "|" },
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 18,
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_buffer_default_icon = true,
		show_close_icon = false,
		show_tab_indicators = false,
		persist_buffer_sort = true,
		separator_style = "thin",
		diagnostics = "nvim_lsp",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(_, _, diagnostics_dict, _)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "☨")
				s = s .. n .. sym
			end
			return s
		end,
		custom_filter = function(buf_number, _)
			if
				vim.bo[buf_number].buftype ~= "terminal"
				and vim.bo[buf_number].buftype ~= "quickfix"
				and vim.bo[buf_number].filetype ~= "dap-repl"
			then
				return true
			else
				return false
			end
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})

-- keymap
vim.keymap.set("n", "<C-k>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<C-m>", ":b#<CR>", { silent = true })
require("which-key").register({
	b = {
		name = "bufferline",
		h = {
			"<cmd>BufferLineMovePrev<CR>",
			"move current tab to previous position",
		},
		l = {
			"<cmd>BufferLineMoveNext<CR>",
			"move current tab to next position",
		},
		e = {
			"<cmd>BufferLineSortByExtension<CR>",
			"sort tabs by extension",
		},
		d = {
			"<cmd>BufferLineSortByExtension<CR>",
			"sort tabs by directory",
		},
		o = {
			"<cmd>BufferLinePick<CR>",
			"switch buffer",
		},
		p = {
			"<cmd>BufferLineTogglePin<CR>",
			"toggle pin ",
		},
	},
}, {
	mode = "n",
	prefix = "<space>",
})
