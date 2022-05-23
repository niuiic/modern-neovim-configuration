local utils = require("utils")

utils.fn.mapRegister({
    t = {
        name = "trouble",
        d = {
            "<cmd>TroubleToggle workspace_diagnostics<CR>",
            "open diagnostics",
        },
        q = {
            "<cmd>TroubleToggle quickfix<CR>",
            "open quickfix",
        },
        l = {
            "<cmd>TroubleToggle loclist<CR>",
            "open loclist",
        },
        f = {
            "<cmd>TroubleToggle lsp_references<CR>",
            "open lsp references list",
        },
    },
}, {
    mode = "n",
    prefix = "<localleader>",
})
