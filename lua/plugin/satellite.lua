return {
	config = function()
		vim.api.nvim_set_hl(0, "SatelliteCursor", {
			fg = "#00ffff",
		})
		require("satellite").setup({
			current_only = true,
			winblend = 0,
			excluded_filetypes = {
				"NvimTree",
				"terminal",
				"Trouble",
				"spectre_panel",
				"divider",
				"lspsagaoutline",
				"dapui_scopes",
				"dapui_breakpoints",
				"dapui_stacks",
				"dapui_watches",
				"dap-repl",
				"dapui_console",
			},
		})
	end,
}
