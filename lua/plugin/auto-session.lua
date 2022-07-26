local utils = require("utils")

utils.fn.require("auto-session").setup({
	log_level = "info",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
	auto_session_enabled = false,
	auto_save_enabled = false,
	auto_restore_enabled = false,
	auto_session_suppress_dirs = false,
	auto_session_use_git_branch = false,
	-- the configs below are lua only
	bypass_session_save_file_types = nil,
})

-- keymap
utils.fn.whichKeyMap({
	s = {
		name = "session",
		s = {
			"<cmd>SaveSession<CR>",
			"save session",
		},
		r = {
			"<cmd>RestoreSession<CR>",
			"restore session",
		},
		d = {
			"<cmd>DeleteSession<CR>",
			"delete session",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
