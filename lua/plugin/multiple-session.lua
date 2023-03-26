return {
	config = function()
		require("multiple-session").setup({
			default_arg_num = 1,
			on_session_saved = function(session_dir)
				require("trailblazer").save_trailblazer_state_to_file(session_dir .. "/" .. "trailBlazer")
			end,
			on_session_restored = function(session_dir)
				if require("niuiic-core").file.file_or_dir_exists(session_dir .. "/" .. "trailBlazer") then
					require("trailblazer").load_trailblazer_state_from_file(session_dir .. "/" .. "trailBlazer")
				end
			end,
		})
	end,
	keys = {
		{ "<leader>ss", "<cmd>SaveSession<CR>", desc = "save session" },
		{ "<leader>sr", "<cmd>RestoreSession<CR>", desc = "restore session" },
		{ "<leader>sa", "<cmd>EnableAutoSaveSession<CR>", desc = "enable auto save session" },
		{ "<leader>sA", "<cmd>DisableAutoSaveSession<CR>", desc = "disable auto save session" },
		{ "<leader>sd", "<cmd>DeleteSession<CR>", desc = "delete session" },
	},
	lazy = false,
	dependencies = { "niuiic/niuiic-core.nvim" },
}
