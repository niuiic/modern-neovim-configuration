-- lsps installed:
-- ◍ sqls
-- ◍ vue-language-server
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
-- install verible, clangd, glslang manually

-- daps installed:
-- ◍ chrome-debug-adapter
-- ◍ debugpy
-- ◍ delve
-- install lldb-vscode manually (it is installed with lldb)

-- formatters installed:
-- ◍ black
-- ◍ golines
-- ◍ prettier
-- ◍ shfmt
-- ◍ sql-formatter
-- ◍ stylua
-- ◍ taplo (installed as a lsp)
-- install cmake-format, verible, goimports manually

require("mason").setup()
