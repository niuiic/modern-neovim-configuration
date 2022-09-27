local utils = require("utils")

utils.fn.require("close_buffers").setup()

utils.fn.map("n", "<C-x>", ":BDelete this<CR>", utils.var.opt)
