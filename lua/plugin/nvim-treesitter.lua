local config = function()
	require("nvim-dap-repl-highlights").setup()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"css",
			"html",
			"sql",
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
			"markdown_inline",
			"git_rebase",
			"gitcommit",
			"gitignore",
			"rust",
			"scss",
			"toml",
			"todotxt",
			"tsx",
			"vim",
			"yaml",
			"glsl",
			"wgsl",
			"regex",
			"dap_repl",
			"mermaid",
			"typst",
			"dart",
		},
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		intent = { enable = true },
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
					["am"] = "@comment.outer",
					["im"] = "@comment.inner",
				},
			},
		},
	})
end

return {
	config = config,
	build = ":TSUpdate",
}
