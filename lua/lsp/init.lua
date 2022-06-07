local utils = require("utils")

-- common lsp config
local on_attach = function(client, _)
	-- disable default format feature of lsp
	client.server_capabilities.document_formatting = false -- 0.7 and earlier
	client.server_capabilities.documentFormattingProvider = false -- 0.8 and hopefully later
end

-- nvim-cmp support
local capabilities = utils.fn.require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- load all lsp config
for _, value in pairs(utils.var.lspList) do
	local config = utils.fn.require("lsp/" .. value)

	-- set on_attach
	if config.on_attach == nil then
		config.on_attach = on_attach
	else
		local on_attach_tmp = config.on_attach
		config.on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			on_attach_tmp(client, bufnr)
		end
	end

	-- set capabilities
	if config.modify_capabilities == nil then
		config.capabilities = capabilities
	else
		config.capabilities = config.modify_capabilities(capabilities)
	end

	utils.fn.require("lspconfig")[value].setup(config)
end
