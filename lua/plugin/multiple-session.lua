return {
	config = function()
		local core = require("core")
		local dap_utils = require("dap-utils")
		require("multiple-session").setup({
			on_session_saved = function(session_dir)
				dap_utils.store_breakpoints(session_dir .. "/breakpoints")
				dap_utils.store_watches(session_dir .. "/watches")
				require("quickfix").store(session_dir .. "/quickfix")
				require("track").store(session_dir .. "/track")
				vim.cmd("wundo " .. session_dir .. "/undo")
			end,
			on_session_restored = function(session_dir)
				if core.file.file_or_dir_exists(session_dir .. "/breakpoints") then
					dap_utils.restore_breakpoints(session_dir .. "/breakpoints")
				end
				if core.file.file_or_dir_exists(session_dir .. "/watches") then
					dap_utils.restore_watches(session_dir .. "/watches")
				end
				if core.file.file_or_dir_exists(session_dir .. "/quickfix") then
					require("quickfix").restore(session_dir .. "/quickfix")
				end
				if core.file.file_or_dir_exists(session_dir .. "/track") then
					require("track").restore(session_dir .. "/track")
				end
				if core.file.file_or_dir_exists(session_dir .. "/undo") then
					vim.cmd("rundo " .. session_dir .. "/undo")
				end
			end,
		})
	end,
	keys = {
		{
			"<leader>ss",
			function()
				require("multiple-session").save_session()
			end,
			desc = "save session",
		},
		{
			"<leader>sr",
			function()
				require("multiple-session").restore_session()
			end,
			desc = "restore session",
		},
		{
			"<leader>sd",
			function()
				require("multiple-session").delete_session()
			end,
			desc = "delete session",
		},
	},
	lazy = false,
}
