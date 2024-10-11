return {
	config = function()
		local core = require("core")
		local omega = require("omega")

		require("multiple-session").setup({
			on_session_saved = function(session_dir)
				require("dap-utils").store_breakpoints(session_dir .. "/breakpoints")
				require("dap-utils").store_watches(session_dir .. "/watches")
				require("quickfix").store(session_dir .. "/quickfix")
				require("track").store(session_dir .. "/track")
				vim.cmd("wundo " .. session_dir .. "/undo")
			end,
			on_session_restored = function(session_dir)
				if omega.exist(session_dir .. "/breakpoints") then
					require("dap-utils").restore_breakpoints(session_dir .. "/breakpoints")
				end
				if omega.exist(session_dir .. "/watches") then
					require("dap-utils").restore_watches(session_dir .. "/watches")
				end
				if omega.exist(session_dir .. "/quickfix") then
					require("quickfix").restore(session_dir .. "/quickfix")
				end
				if omega.exist(session_dir .. "/track") then
					require("track").restore(session_dir .. "/track")
				end
				if omega.exist(session_dir .. "/undo") then
					vim.cmd("rundo " .. session_dir .. "/undo")
				end

				for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_get_option_value("filetype", { buf = bufnr }) == "notify" then
						return
					end
					if not omega.exist(vim.api.nvim_buf_get_name(bufnr)) then
						require("mini.bufremove").delete(bufnr)
					end
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
