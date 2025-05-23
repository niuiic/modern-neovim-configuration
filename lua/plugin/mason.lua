-- lsps installed:
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
-- ◍ tinymist
-- ◍ dockerfile-language-server
-- ◍ docker-compose-language-service
-- ◍ glsl_analyzer
-- ◍ some-sass-language-server
-- ◍ css-variables-language-server
-- ◍ pyright
-- ◍ deno

-- daps installed:
-- ◍ bash-debug-adapter
-- ◍ js-debug-adapter
-- ◍ debugpy
-- install lldb manually

-- formatters installed:
-- ◍ prettier
-- ◍ shfmt
-- ◍ stylua
-- ◍ xmlformatter
-- ◍ black
-- ◍ typstyle
-- ◍ biome

return {
	config = function()
		require("mason").setup()
	end,
	keys = {
		{
			"<leader>ni",
			"<cmd>Mason<cr>",
			desc = "lsp installation",
		},
	},
	lazy = false,
}
