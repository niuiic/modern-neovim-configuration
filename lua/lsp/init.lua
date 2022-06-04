local utils = require("utils")

-- common lsp config
local on_attach = function(client, _)
	-- disable default format feature of lsp
	client.server_capabilities.document_formatting = false -- 0.7 and earlier
	client.server_capabilities.documentFormattingProvider = false -- 0.8 and hopefully later
end
-- nvim-cmp support
local capabilities = utils.fn.require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.offsetEncoding = "utf-8"

-- load all lsp config
for _, value in pairs(utils.var.lspList) do
	local config = utils.fn.require("lsp/" .. value)
	-- add common config
	if value.on_attach == nil then
		config.on_attach = on_attach
	end
	if value.capabilities == nil then
		config.capabilities = capabilities
	end

	utils.fn.require("lspconfig")[value].setup(utils.fn.require("lsp/" .. value))
end
