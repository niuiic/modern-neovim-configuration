local config = function()
	local core = require("core")

	require("bufferline").setup({
		options = {
			mode = "buffers",
			color_icons = true,
			indicator = { style = "none" },
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
			custom_filter = function(bufnr)
				local excluded_ft = {
					"dap-repl",
					"divider",
					"sqls_output",
					"trouble",
				}
				if
					core.lua.list.includes(excluded_ft, function(ft)
						return vim.bo[bufnr].filetype == ft
					end)
				then
					return false
				end

				return true
			end,
		},
		highlights = {
			buffer_selected = {
				fg = "#00ffff",
			},
		},
	})
end

local keys = {
	{ "<space>bh", "<cmd>BufferLineMovePrev<cr>", desc = "move current tab to previous position" },
	{ "<space>bl", "<cmd>BufferLineMoveNext<cr>", desc = "move current tab to next position" },
	{ "<space>be", "<cmd>BufferLineSortByExtension<cr>", desc = "sort tabs by extension" },
	{ "<space>bd", "<cmd>BufferLineSortByExtension<cr>", desc = "sort tabs by directory" },
	{ "<space>bo", "<cmd>BufferLinePick<cr>", desc = "switch buffer" },
	{ "<space>bp", "<cmd>BufferLineTogglePin<cr>", desc = "toggle pin " },
	{ "<C-k>", "<cmd>BufferLineCycleNext<cr>" },
	{ "<C-j>", "<cmd>BufferLineCyclePrev<cr>" },
}

return {
	config = config,
	keys = keys,
	dependencies = "kyazdani42/nvim-web-devicons",
	event = "VimEnter",
}
