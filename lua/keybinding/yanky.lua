local utils = require("utils")

utils.fn.map("n", "p", "<Plug>(YankyPutAfter)", utils.var.opt)
utils.fn.map("n", "P", "<Plug>(YankyPutBefore)", utils.var.opt)
utils.fn.map("x", "p", "<Plug>(YankyPutAfter)", utils.var.opt)
utils.fn.map("x", "P", "<Plug>(YankyPutBefore)", utils.var.opt)

require("telescope").load_extension("yank_history")

utils.fn.mapRegister({
    p = {
        "<cmd>Telescope yank_history<CR>",
        "yank history",
    },
}, {
    mode = "n",
    prefix = "<localleader>",
})
