local status, comment = pcall(require, "Comment")
if not status then
	vim.notify("not found comment.nvim")
	return
end

comment.setup({
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
