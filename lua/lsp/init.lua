local core = require("core")

local lsp_list = {
	"cssls",
	"volar",
	"lua_ls",
	"gopls",
	"bashls",
	"cssmodules_ls",
	"eslint",
	"html",
	"jsonls",
	"rust_analyzer",
	"sqlls",
	"clangd",
	"taplo",
	"stylelint_lsp",
	"pyright",
	"wgsl_analyzer",
	"yamlls",
	"marksman",
	"dotls",
	"lemminx",
	"glslls",
	"typst_lsp",
	"dockerls",
	"nginx_language_server",
}

-- nvim-cmp support
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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

vim.diagnostic.config({
	float = { border = "rounded" },
})

vim.cmd("hi LspInlayHint guibg=none guifg=#33FFBD")
