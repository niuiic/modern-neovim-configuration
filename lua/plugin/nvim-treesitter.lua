local config = function()
	require("nvim-treesitter.configs").setup({
		-- use :TSInstallInfo to check pasers
		ensure_installed = {
			"bash",
			"c",
			"cmake",
			"cpp",
			"css",
			"go",
			"gomod",
			"html",
			"dockerfile",
			"javascript",
			"typescript",
			"vue",
			"json",
			"jsdoc",
			"lua",
			"luadoc",
			"make",
			"markdown",
			"help",
			"markdown_inline",
			"ninja",
			"git_rebase",
			"gitcommit",
			"gitignore",
			"python",
			"rust",
			"scss",
			"toml",
			"todotxt",
			"tsx",
			"verilog",
			"vim",
			"yaml",
			"glsl",
			"wgsl",
			"dot",
			"latex",
			"java",
			"regex",
		},
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		intent = { enable = true },
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
			colors = { "#0099ff", "#00ff00", "#ff4dc3", "#ffff00", "#ff9933" },
		},
		matchup = {
			enable = true,
		},
		-- check more textobjects on https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
		},
	})
end

return {
	config = config,
	build = ":TSUpdate",
}
