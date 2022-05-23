local utils = require("utils")

utils.fn.map("n", "<leader>gg", ":G ", utils.var.opt)
utils.fn.map("n", "<leader>gf", "Ggrep ", utils.var.opt)
utils.fn.map("n", "<leader>gv", "GMove ", utils.var.opt)
utils.fn.map("n", "<leader>gm", "G commit -m ", utils.var.opt)

utils.fn.mapRegister({
    g = {
        name = "git command",
        g = {
            "git command",
        },
        l = {
            "<cmd>G log<CR>",
            "git log",
        },
        s = {
            "<cmd>G status<CR>",
            "git status",
        },
        f = { "git grep" },
        v = { "git move" },
        m = { "git commit" },
        d = {
            "<cmd>GDelete<CR>",
            "git delete",
        },
        w = {
            "<cmd>Gwrite<CR>",
            "git write",
        },
        r = {
            "<cmd>Gread<CR>",
            "git read",
        },
        b = {
            "<cmd>G blame<CR>",
            "git blame",
        },
    },
}, {
    mode = "n",
    prefix = "<leader>",
})
