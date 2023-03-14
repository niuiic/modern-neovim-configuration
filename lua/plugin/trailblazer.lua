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
			newest_mark_symbol = "•",
			cursor_mark_symbol = "•",
			next_mark_symbol = "•",
			previous_mark_symbol = "•",
		},
	})
end

return {
	config = config,
	keys = {
		{ "<space>mm", "<cmd>TrailBlazerNewTrailMark<CR>", desc = "toggle mark" },
		{ "<space>mk", "<cmd>TrailBlazerPeekMovePreviousUp<CR>", desc = "go to previous mark" },
		{ "<space>mj", "<cmd>TrailBlazerPeekMoveNextDown<CR>", desc = "go to next mark" },
		{ "<space>mL", "<cmd>TrailBlazerTrackBack<CR>", desc = "go to/remove last mark" },
		{ "<space>md", "<cmd>TrailBlazerDeleteAllTrailMarks<CR>", desc = "delete all marks" },
		{ "<space>ml", "<cmd>TrailBlazerToggleTrailMarkList<CR>", desc = "toggle mark list" },
	},
}
