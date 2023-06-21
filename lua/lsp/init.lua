local core = require("niuiic-core")

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
	"verible",
	"stylelint_lsp",
	"pyright",
	"tsserver",
	"wgsl_analyzer",
	"yamlls",
	"marksman",
	"dotls",
	"lemminx",
	"texlab",
	"jdtls",
	"dartls",
}

-- common lsp config
local on_attach = function(client, _)
	-- disable default format feature of lsp
	client.server_capabilities.documentFormattingProvider = false
end

-- nvim-cmp support
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- load all lsp config
for _, value in pairs(lspList) do
	local config = require("lsp/" .. value)

	-- set on_attach
	if config.on_attach == nil then
		config.on_attach = on_attach
	else
		local on_attach_from_config = config.on_attach
		config.on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			on_attach_from_config(client, bufnr)
		end
	end

	-- set capabilities
	if config.modify_capabilities == nil then
		config.capabilities = capabilities
	else
		config.capabilities = config.modify_capabilities(core.lua.table.clone(capabilities))
	end

	-- set lsp config
	require("lspconfig")[value].setup(config)
end

vim.diagnostic.config({
	float = { border = "single" },
})

require("lspconfig.ui.windows").default_options = {
	border = "single",
}

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	callback = function()
		vim.lsp.buf.inlay_hint(0, false)
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function()
		vim.lsp.buf.inlay_hint(0, true)
	end,
})

vim.cmd("hi LspInlayHint guibg=none guifg=#33FFBD")
