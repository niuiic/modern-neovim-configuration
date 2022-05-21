require("lspconfig").tsserver.setup({
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    root_dir = require("utils").fn.getWorkspacePath,
    -- see https://github.com/typescript-language-server/typescript-language-server#initializationoptions
    init_options = {
        hostInfo = "neovim",
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        require("utils").fn.setLspKeyMap(bufnr)
    end,
})
