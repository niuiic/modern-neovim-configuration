local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("not found bufferline")
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		numbers = "ordinal",
		left_mouse_command = "bdelete! %d",
		right_mouse_command = nil,
		close_command = nil,
		middle_mouse_command = nil,
		indicator_icon = "|",
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
		show_buffer_close_icons = true,
		show_buffer_default_icon = true,
		show_close_icon = true,
		show_tab_indicators = false,
		persist_buffer_sort = true,
		separator_style = "thin",
		diagnostics = "coc",
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
	},
	custom_filter = function(buf_number, _)
		if
			vim.bo[buf_number].filetype ~= "packer"
			and vim.bo[buf_number].filetype ~= "lua"
			and vim.bo[buf_number].buftype ~= "terminal"
			and vim.bo[buf_number].buftype ~= "quickfix"
		then
			return true
		else
			return false
		end
	end,
	offsets = {
		{
			filetype = "coc-explorer",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left",
		},
	},
})
