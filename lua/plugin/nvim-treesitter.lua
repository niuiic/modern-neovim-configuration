---@diagnostic disable: inject-field, missing-fields
local config = function()
	require("nvim-dap-repl-highlights").setup()
	require("nvim-treesitter.parsers").get_parser_configs().scss.install_info.url =
		"https://github.com/savetheclocktower/tree-sitter-scss"
	require("nvim-treesitter.parsers").get_parser_configs().d2 = {
		install_info = {
			url = "https://git.pleshevski.ru/pleshevskiy/tree-sitter-d2",
			revision = "main",
			files = { "src/parser.c", "src/scanner.c" },
		},
		filetype = "d2",
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
		matchup = {
			enable = true,
		},
	})
end

return {
	config = config,
	build = ":TSUpdate",
}
