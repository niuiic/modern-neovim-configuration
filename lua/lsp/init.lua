local core = require("core")

local lsp_list = {
	"cssls",
	"volar",
	"lua_ls",
	"bashls",
	"cssmodules_ls",
	"eslint",
	"html",
	"jsonls",
	"sqls",
	"taplo",
	"stylelint_lsp",
	"wgsl_analyzer",
	"yamlls",
	"marksman",
	"lemminx",
	"glsl_analyzer",
	"typst_lsp",
	"dockerls",
	"nginx_language_server",
	"somesass_ls",
	"css_variables",
	"vtsls",
	"pyright",
}

-- nvim-cmp support
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- load all lsp config
core.lua.list.each(lsp_list, function(value)
	local config = require("lsp/" .. value)

	-- set capabilities
	if config.modify_capabilities == nil then
		config.capabilities = capabilities
	else
		config.capabilities = config.modify_capabilities(core.lua.table.clone(capabilities))
	end

	-- set handlers
	if not config.handlers then
		config.handlers = {}
	end
	config.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

	-- set lsp config
	require("lspconfig")[value].setup(config)
end)

vim.cmd("hi LspInlayHint guibg=none guifg=#33FFBD")
