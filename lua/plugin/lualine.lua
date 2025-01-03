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
				"divider",
				"lspsagaoutline",
				"dapui_scopes",
				"dapui_breakpoints",
				"dapui_stacks",
				"dapui_watches",
				"dap-repl",
				"dapui_console",
				"track",
			},
			always_divide_middle = true,
			globalstatus = false,
			theme = {
				normal = {
					a = { fg = "#6633FF" },
					b = { fg = "#6633FF" },
					c = { fg = "#6633FF" },
					x = { fg = "#6633FF" },
					y = { fg = "#6633FF" },
					z = { fg = "#6633FF" },
				},
				inactive = {
					a = { fg = "#5D6D7E" },
					b = { fg = "#5D6D7E" },
					c = { fg = "#5D6D7E" },
					x = { fg = "#5D6D7E" },
					y = { fg = "#5D6D7E" },
					z = { fg = "#5D6D7E" },
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
