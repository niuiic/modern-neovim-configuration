local config = function()
	require("trailblazer").setup({
		mappings = {
			nv = {
				motions = {
					new_trail_mark = "",
					track_back = "",
					peek_move_next_down = "",
					peek_move_previous_up = "",
					move_to_nearest = "",
					toggle_trail_mark_list = "",
				},
				actions = {
					delete_all_trail_marks = "",
					paste_at_last_trail_mark = "",
					paste_at_all_trail_marks = "",
					set_trail_mark_select_mode = "",
					switch_to_next_trail_mark_stack = "",
					switch_to_previous_trail_mark_stack = "",
					set_trail_mark_stack_sort_mode = "",
				},
			},
		},
		trail_options = {
			trail_mark_priority = 11,
			newest_mark_symbol = "M",
			cursor_mark_symbol = "M",
			next_mark_symbol = "M",
			previous_mark_symbol = "M",
			multiple_mark_symbol_counters_enabled = false,
			number_line_color_enabled = false,
			trail_mark_in_text_highlights_enabled = false,
		},
		hl_groups = {
			TrailBlazerTrailMarkNext = {
				guifg = "#00ff00",
				guibg = "none",
				gui = "bold",
			},
			TrailBlazerTrailMarkPrevious = {
				guifg = "#ff00ff",
				guibg = "none",
				gui = "bold",
			},
		},
	})
end

return {
	config = config,
	keys = {
		{ "<space>mm", "<cmd>TrailBlazerNewTrailMark<CR>", desc = "toggle mark" },
		{ "<C-p>", "<cmd>TrailBlazerNewTrailMark<CR>", desc = "toggle mark" },
		{ "<space>mk", "<cmd>TrailBlazerPeekMovePreviousUp<CR>", desc = "go to previous mark" },
		{ "<C-h>", "<cmd>TrailBlazerPeekMovePreviousUp<CR>", desc = "go to previous mark" },
		{ "<space>mj", "<cmd>TrailBlazerPeekMoveNextDown<CR>", desc = "go to next mark" },
		{ "<C-l>", "<cmd>TrailBlazerPeekMoveNextDown<CR>", desc = "go to next mark" },
		{ "<space>mL", "<cmd>TrailBlazerTrackBack<CR>", desc = "go to/remove last mark" },
		{ "<space>md", "<cmd>TrailBlazerDeleteAllTrailMarks<CR>", desc = "delete all marks" },
		{ "<space>ml", "<cmd>TrailBlazerToggleTrailMarkList<CR>", desc = "toggle mark list" },
	},
}
