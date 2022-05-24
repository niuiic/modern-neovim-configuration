local utils = require("utils")

require("lspconfig").cssmodules_ls.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false -- 0.7 and earlier
        client.server_capabilities.documentFormattingProvider = false -- 0.8 and hopefully later
        utils.fn.setLspKeyMap(bufnr)
    end,
    root_dir = utils.fn.getWorkspacePath,
})
