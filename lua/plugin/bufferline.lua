local config = function()
	require("bufferline").setup({
		options = {
			mode = "buffers",
			indicator = { icon = "", style = "icon" },
			buffer_close_icon = "",
			modified_icon = "●",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 16,
			max_prefix_length = 16,
			tab_size = 16,
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = false,
			persist_buffer_sort = true,
			separator_style = { ")", ")" },
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
					and vim.bo[buf_number].filetype ~= "divider"
					and vim.bo[buf_number].filetype ~= "lspsagaoutline"
				then
					return true
				else
					return false
				end
			end,
		},
	})
end

local keys = {
	{ "<space>bh", "<cmd>BufferLineMovePrev<CR>", desc = "move current tab to previous position" },
	{ "<space>bl", "<cmd>BufferLineMoveNext<CR>", desc = "move current tab to next position" },
	{ "<space>be", "<cmd>BufferLineSortByExtension<CR>", desc = "sort tabs by extension" },
	{ "<space>bd", "<cmd>BufferLineSortByExtension<CR>", desc = "sort tabs by directory" },
	{ "<space>bo", "<cmd>BufferLinePick<CR>", desc = "switch buffer" },
	{ "<space>bp", "<cmd>BufferLineTogglePin<CR>", desc = "toggle pin " },
	{ "<C-k>", "<cmd>BufferLineCycleNext<CR>" },
	{ "<C-j>", "<cmd>BufferLineCyclePrev<CR>" },
}

return {
	config = config,
	keys = keys,
	dependencies = "kyazdani42/nvim-web-devicons",
	lazy = false,
}
