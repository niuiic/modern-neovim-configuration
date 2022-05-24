require("lspconfig").bashls.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        require("utils").fn.setLspKeyMap(bufnr)
    end,
})
