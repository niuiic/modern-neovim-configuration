local utils = require("utils")

-- see configuration on  https://github.com/lighttiger2505/sqls
require("lspconfig").sqls.setup({
    cmd = { "sqls", "-config", utils.fn.getWorkspacePath("/.sql_root") .. "/config.yml" },
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        require("utils").fn.setLspKeyMap(bufnr)
        require("sqls").on_attach(client, bufnr)
    end,
})
