return {
	config = function()
		local utils = require("utils")

		require("auto-session").setup({
			auto_session_enabled = false,
			auto_session_create_enabled = false,
			auto_session_root_dir = utils.fn.root_pattern() .. "/.nvim/session/",
		})
	end,
	keys = {
		{ "<leader>ss", "<cmd>SaveSession<CR>", desc = "save session" },
		{ "<leader>sr", "<cmd>RestoreSession<CR>", desc = "restore session" },
		{ "<leader>sd", "<cmd>DeleteSession<CR>", desc = "delete session" },
	},
}
