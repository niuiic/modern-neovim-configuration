require("pretty-fold").setup({})

local foldPreview = require("fold-preview")
foldPreview.setup({
	border = "single",
})

local keymap = vim.keymap
keymap.amend = require("keymap-amend")
local map = foldPreview.mapping

keymap.amend("n", "H", foldPreview.show_preview)
keymap.amend("n", "l", map.close_preview_open_fold)
keymap.amend("n", "zo", map.close_preview)
keymap.amend("n", "zO", map.close_preview)
keymap.amend("n", "zc", map.close_preview_without_defer)
keymap.amend("n", "zR", map.close_preview)
keymap.amend("n", "zM", map.close_preview_without_defer)
