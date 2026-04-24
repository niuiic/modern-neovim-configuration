---@diagnostic disable: inject-field, missing-fields
local config = function()
	require("nvim-dap-repl-highlights").setup()

	vim.api.nvim_create_autocmd("User", {
		pattern = "TSUpdate",
		callback = function()
			require("nvim-treesitter.parsers").scss.install_info.url =
				"https://github.com/savetheclocktower/tree-sitter-scss"
			require("nvim-treesitter.parsers").d2 = {
				install_info = {
					url = "https://github.com/ravsii/tree-sitter-d2",
					branch = "main",
					files = { "src/parser.c" },
				},
			}
			require("nvim-treesitter.parsers").jsonl = {
				install_info = {
					url = "https://codeberg.org/kristoferssolo/tree-sitter-jsonl",
					files = { "src/parser.c" },
					branch = "main",
				},
			}
		end,
	})

	local langs = {
		"bash",
		"css",
		"html",
		"sql",
		"dockerfile",
		"javascript",
		"typescript",
		"vue",
		"json",
		"json5",
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
		"vimdoc",
		"python",
		"xml",
		"nu",
		"http",
		"d2",
	}
	require("nvim-treesitter").install(langs)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = langs,
		callback = function()
			vim.treesitter.start()
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.wo.foldmethod = "expr"
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	})
end

return {
	config = config,
	build = ":TSUpdate",
	dependencies = { "neovim-treesitter/treesitter-parser-registry" },
}
