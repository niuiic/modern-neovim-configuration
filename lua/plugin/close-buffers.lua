local utils = require("utils")

utils.fn.require("close_buffers").setup()

vim.keymap.set("n", "<C-x>", ":BDelete this<CR>", { silent = true })
