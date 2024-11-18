return {
	config = function()
		vim.api.nvim_set_hl(0, "Divider1", { fg = "#ff00ff" })
		vim.api.nvim_set_hl(0, "Divider2", { fg = "#00a0ff" })
		vim.api.nvim_set_hl(0, "Divider3", { fg = "#00ff7c" })

		require("divider").setup({
			is_enabled = function(bufnr)
				local ok, value = pcall(vim.api.nvim_buf_get_var, bufnr, "divider")
				if ok and value == "disabled" then
					return false
				end

				if
					not vim.bo.filetype
					or vim.list_contains({
						"help",
						"NvimTree",
						"Outline",
						"dap-repl",
						"trouble",
						"qf",
						"track",
						"TelescopePrompt",
					}, vim.bo.filetype)
				then
					return false
				end

				return true
			end,
			outline = {
				preview_on_hover = false,
			},
			dividers = {
				{
					pattern = [[ %% (.+) %%]],
					level = 1,
					hl_group = "Divider1",
					mark_char = "-",
					mark_pos = "bottom",
					is_visible_in_outline = true,
					is_enabled = function()
						return true
					end,
				},
				{
					pattern = [[ %%%% (.+) %%%%]],
					level = 2,
					hl_group = "Divider2",
					mark_char = "-",
					mark_pos = "bottom",
					is_visible_in_outline = true,
					is_enabled = function()
						return true
					end,
				},
				{
					pattern = [[ %%%%%% (.+) %%%%%%]],
					level = 3,
					hl_group = "Divider3",
					mark_char = "-",
					mark_pos = "bottom",
					is_visible_in_outline = true,
					is_enabled = function()
						return true
					end,
				},
			},
		})
	end,
	keys = {
		{
			"<C-/>",
			function()
				require("divider").toggle_outline()
			end,
			desc = "toggle divider outline",
		},
	},
	lazy = false,
}
