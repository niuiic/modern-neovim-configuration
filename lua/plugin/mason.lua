-- lsps installed:
-- ◍ sqls
-- ◍ vue-language-server
-- ◍ bash-language-server
-- ◍ css-lsp
-- ◍ cssmodules-language-server
-- ◍ eslint-lsp
-- ◍ html-lsp
-- ◍ json-lsp
-- ◍ lua-language-server
-- ◍ rust-analyzer
-- ◍ stylelint-lsp
-- ◍ taplo
-- ◍ vtsls
-- ◍ wgsl-analyzer
-- ◍ yaml-language-server
-- ◍ marksman
-- ◍ lemminx
-- ◍ typst-lsp
-- ◍ dockerfile-language-server
-- ◍ nginx-language-server
-- ◍ glsl_analyzer
-- ◍ some-sass-language-server
-- ◍ css-variables-language-server

-- daps installed:
-- ◍ bash-debug-adapter
-- ◍ js-debug-adapter
-- ◍ codelldb
-- ◍ dart-debug-adapter

-- formatters installed:
-- ◍ prettier
-- ◍ shfmt
-- ◍ sqlfluff
-- ◍ stylua
-- ◍ xmlformatter
-- install typstfmt, nginxbeautifier manually

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
