local utils = require("utils")

require("reach").setup({})

-- delete all marks
vim.keymap.set("n", "<A-m>", "<cmd>:delm a-z A-Z<CR>", { silent = true })
