local utils = require("utils")

require("lspconfig").eslint.setup({
    settings = {
        codeAction = {
            disableRuleComment = {
                enable = true,
                location = "separateLine",
            },
            showDocumentation = {
                enable = true,
            },
        },
        codeActionOnSave = {
            enable = false,
            mode = "all",
        },
        format = true,
        nodePath = "",
        onIgnoredFiles = "off",
        packageManager = "yarn",
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {
            mode = "location",
        },
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false -- 0.7 and earlier
        client.server_capabilities.documentFormattingProvider = false -- 0.8 and hopefully later
        utils.fn.setLspKeyMap(bufnr)
    end,
    root_dir = utils.fn.getWorkspacePath,
    handlers = {
        ["eslint/noLibrary"] = function()
            return {}
        end,
    },
})
