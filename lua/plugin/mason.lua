-- lsps installed:
-- ◍ sqlls
-- ◍ dot-language-server
-- ◍ vue-language-server
-- ◍ texlab
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
-- ◍ jdtls
-- ◍ typst-lsp
-- ◍ verible
-- ◍ nil
-- ◍ dockerfile-language-server
-- ◍ nginx-language-server
-- install clangd, glslang, dart, glsl-language-server manually

-- daps installed:
-- ◍ debugpy
-- ◍ delve
-- ◍ bash-debug-adapter
-- ◍ js-debug-adapter
-- ◍ dart-debug-adapter
-- ◍ codelldb
-- install lldb-vscode manually

-- formatters installed:
-- ◍ black
-- ◍ golines
-- ◍ prettier
-- ◍ shfmt
-- ◍ sqlfluff
-- ◍ stylua
-- ◍ xmlformatter
-- ◍ google-java-format
-- install cmake-format, goimports, typstfmt, alejandra, dockerfile-utils, nginxbeautifier manually

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
