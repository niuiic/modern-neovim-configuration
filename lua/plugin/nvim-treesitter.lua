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
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"rust",
			"scss",
			"toml",
			"todotxt",
			"tsx",
			"yaml",
			"glsl",
			"wgsl",
			"regex",
			"dap_repl",
			"mermaid",
			"typst",
			"vimdoc",
			"python",
			"nginx",
			"xml",
		},
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		intent = { enable = true },
		matchup = {
			enable = true,
		},
	})
end

return {
	config = config,
	build = ":TSUpdate",
}
