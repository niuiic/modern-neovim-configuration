-- lsps installed:
-- ◍ sqls
-- ◍ dot-language-server
-- ◍ vue-language-server
-- ◍ texlab
-- ◍ ltex-ls
-- ◍ bash-language-server
-- ◍ css-lsp
-- ◍ cssmodules-language-server
-- ◍ eslint-lsp
-- ◍ gopls
-- ◍ html-lsp
-- ◍ json-lsp
-- ◍ lua-language-server
-- ◍ pyright
-- ◍ rust-analyzer
-- ◍ stylelint-lsp
-- ◍ taplo
-- ◍ typescript-language-server
-- ◍ wgsl-analyzer
-- ◍ yaml-language-server
-- ◍ marksman
-- ◍ lemminx
-- install verible, clangd, glslang manually

-- daps installed:
-- ◍ chrome-debug-adapter
-- ◍ debugpy
-- ◍ delve
-- ◍ bash-debug-adapter
-- ◍ js-debug-adapter

-- install lldb-vscode manually (it is installed with lldb)

-- formatters installed:
-- ◍ black
-- ◍ golines
-- ◍ prettier
-- ◍ shfmt
-- ◍ sql-formatter
-- ◍ stylua
-- ◍ taplo (installed as a lsp)
-- ◍ xmlformatter
-- install cmake-format, verible, goimports manually

return {
	config = function()
		require("mason").setup()
	end,
	keys = {
		{
			"<leader>ni",
			"<cmd>Mason<CR>",
			desc = "lsp installation",
		},
	},
	lazy = false,
}
