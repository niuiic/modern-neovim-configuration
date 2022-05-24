local utils = require("utils")

require("lspconfig").cssmodules_ls.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        utils.fn.setLspKeyMap(bufnr)
    end,
    root_dir = utils.fn.getWorkspacePath,
})
