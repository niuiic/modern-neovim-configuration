local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup({
	capabilities = capabilities,
	on_attach = function(_, bufnr)
		-- bind keymap
		require("utils").fn.setLspKeyMap(bufnr)
	end,
})
