local config = function()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			disabled_filetypes = {
				"NvimTree",
				"terminal",
				"trouble",
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
			always_divide_middle = true,
			globalstatus = false,
			theme = {
				normal = {
					a = { fg = "#7093DB", bg = "#00000000" },
					b = { fg = "#7093DB", bg = "#00000000" },
					c = { fg = "#7093DB", bg = "#00000000" },
					x = { fg = "#7093DB", bg = "#00000000" },
					y = { fg = "#7093DB", bg = "#00000000" },
					z = { fg = "#7093DB", bg = "#00000000" },
				},
				inactive = {
					a = { fg = "#5D6D7E", bg = "#00000000" },
					b = { fg = "#5D6D7E", bg = "#00000000" },
					c = { fg = "#5D6D7E", bg = "#00000000" },
					x = { fg = "#5D6D7E", bg = "#00000000" },
					y = { fg = "#5D6D7E", bg = "#00000000" },
					z = { fg = "#5D6D7E", bg = "#00000000" },
				},
			},
		},
		sections = {
			lualine_a = {},
			lualine_b = { { "filename", path = 1 }, "branch", "diff", "diagnostics" },
			lualine_c = {},
			lualine_x = {
				"encoding",
				{ "filetype", colored = false },
				"filesize",
				"progress",
				'os.date("%H:%M:%S", os.time())',
			},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = { { "filename", path = 1 }, "branch", "diff", "diagnostics" },
			lualine_c = {},
			lualine_x = {
				"encoding",
				{ "filetype", colored = false },
				"filesize",
				"progress",
				'os.date("%H:%M:%S", os.time())',
			},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
		theme = "auto",
	})
end

return {
	config = config,
	dependencies = {
		"folke/tokyonight.nvim",
		"kyazdani42/nvim-web-devicons",
	},
}
