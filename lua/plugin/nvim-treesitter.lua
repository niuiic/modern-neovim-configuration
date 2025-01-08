---@diagnostic disable: inject-field, missing-fields
local config = function()
	require("nvim-dap-repl-highlights").setup()
	require("nvim-treesitter.parsers").list.scss.install_info.url =
		"https://github.com/savetheclocktower/tree-sitter-scss"
	require("nvim-treesitter.parsers").list.d2 = {
		install_info = {
			url = "https://github.com/ravsii/tree-sitter-d2",
			branch = "main",
			files = { "src/parser.c" },
		},
	}
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
			"xml",
			"nu",
			"http",
			"d2",
		},
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		intent = { enable = true },
		matchup = { enable = true },
	})
end

return {
	config = config,
	build = ":TSUpdate",
}
