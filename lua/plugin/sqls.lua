local utils = require("utils")

-- keymap
utils.fn.require("which-key").register({
    l = {
        name = "sql cmd",
        r = {
            "<cmd>SqlsExecuteQuery<CR>",
            "exec current line",
        },
        d = {
            "<cmd>SqlsSwitchDatabase<CR>",
            "show databases",
        },
        s = {
            "<cmd>SqlsShowSchemas<CR>",
            "show schemas",
        },
        c = {
            "<cmd>SqlsSwitchConnection<CR>",
            "show connections",
        },
    },
}, {
    mode = "n",
    prefix = "<leader>",
})

utils.fn.require("which-key").register({
    l = {
        name = "sql cmd",
        r = {
            "<Plug>(sqls-execute-query)",
            "exec current ",
        },
    },
}, {
    mode = "v",
    prefix = "<leader>",
})
