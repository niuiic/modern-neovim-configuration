local core = require("core")

local lspList = {
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
core.lua.list.each(lspList, function(value)
	local config = require("lsp/" .. value)

	-- set capabilities
	if config.modify_capabilities == nil then
		config.capabilities = capabilities
	else
		config.capabilities = config.modify_capabilities(core.lua.table.clone(capabilities))
	end

	-- set lsp config
	require("lspconfig")[value].setup(config)
end)

vim.diagnostic.config({
	float = { border = "rounded" },
})

vim.cmd("hi LspInlayHint guibg=none guifg=#33FFBD")
