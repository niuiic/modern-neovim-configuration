local search_cursor_word_in_buffer = function()
	require("telescope.builtin").grep_string({
		search = require("omega").get_selection(),
		search_dirs = { vim.api.nvim_buf_get_name(0) },
	})
end

local search_cursor_word_in_workspace = function()
	require("telescope.builtin").grep_string({
		search = require("omega").get_selection(),
		cwd = require("omega").root_pattern(".git") or vim.fn.getcwd(),
	})
end

local search_word_in_workspace = function()
	require("telescope.builtin").live_grep({
		hidden = true,
		cwd = require("omega").root_pattern(".git") or vim.fn.getcwd(),
	})
end

return {
	search_cursor_word_in_buffer = search_cursor_word_in_buffer,
	search_cursor_word_in_workspace = search_cursor_word_in_workspace,
	search_word_in_workspace = search_word_in_workspace,
}
