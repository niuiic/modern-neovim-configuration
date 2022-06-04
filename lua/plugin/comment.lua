local utils = require("utils")

require("Comment").setup({
	padding = true,
	sticky = true,
	ignore = nil,
	mappings = {
		basic = true,
		extra = false,
		extended = false,
	},
	pre_hook = nil,
	post_hook = nil,
})

local ft = require("Comment.ft")
ft.lua = "--%s"
ft({ "go", "rust", "javascript" }, "//%s")

-- keymap
utils.fn.map("v", "<C-a>", "<Plug>(comment_toggle_linewise_visual)", utils.var.opt)
utils.fn.map("n", "<C-a>", "<Plug>(comment_toggle_current_linewise)", utils.var.opt)
