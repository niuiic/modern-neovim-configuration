local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").tsserver.setup({
    capabilities = capabilities,
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    root_dir = require("utils").fn.getWorkspacePath,
    -- see https://github.com/typescript-language-server/typescript-language-server#initializationoptions
    init_options = {
        hostInfo = "neovim",
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false -- 0.7 and earlier
        client.server_capabilities.documentFormattingProvider = false -- 0.8 and hopefully later
        require("utils").fn.setLspKeyMap(bufnr)
    end,
})
