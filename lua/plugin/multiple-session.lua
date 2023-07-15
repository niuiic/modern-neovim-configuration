return {
	config = function()
		local core = require("core")
		local dap_utils = require("dap-utils")
		require("multiple-session").setup({
			default_arg_num = 2,
			on_session_saved = function(session_dir)
				dap_utils.store_breakpoints(session_dir .. "/breakpoints")
				dap_utils.store_watches(session_dir .. "/watches")
				require("quickfix").store_qf(session_dir .. "/quickfix")
				vim.cmd("wundo" .. session_dir .. "/undo")
			end,
			on_session_restored = function(session_dir)
				if core.file.file_or_dir_exists(session_dir .. "/" .. "breakpoints") then
					dap_utils.restore_breakpoints(session_dir .. "/breakpoints")
				end
				if core.file.file_or_dir_exists(session_dir .. "/watches") then
					dap_utils.restore_watches(session_dir .. "/watches")
				end
				if core.file.file_or_dir_exists(session_dir .. "/" .. "quickfix") then
					require("quickfix").restore_qf(session_dir .. "/quickfix")
				end
				if core.file.file_or_dir_exists(session_dir .. "/undo") then
					vim.cmd("rundo" .. session_dir .. "/undo")
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
}
