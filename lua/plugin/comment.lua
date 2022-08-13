local utils = require("utils")

utils.fn.require("nvim-treesitter.configs").setup({
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			vue = {
				__default = "<!-- %s -->",
				html = "<!-- %s -->",
				style = "/* %s */",
				css = "/* %s */",
				scss = "/* %s */",
				javascript = "// %s",
				typescript = "// %s",
				script = "// %s",
				comment = "<!-- %s -->",
			},
		},
	},
})

utils.fn.require("Comment").setup({
	padding = true,
	sticky = true,
	ignore = nil,
	mappings = {
		basic = true,
		extra = false,
		extended = false,
	},
	post_hook = nil,
	pre_hook = function(ctx)
		local U = utils.fn.require("Comment.utils")

		local location = nil
		if ctx.ctype == U.ctype.block then
			location = utils.fn.require("ts_context_commentstring.utils").get_cursor_location()
		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
			location = utils.fn.require("ts_context_commentstring.utils").get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring({
			key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})

local ft = utils.fn.require("Comment.ft")
ft.lua = "--%s"
ft({ "go", "rust", "javascript" }, "//%s")

-- keymap
utils.fn.map("v", "<C-a>", "<Plug>(comment_toggle_linewise_visual)", utils.var.opt)
utils.fn.map("n", "<C-a>", "<Plug>(comment_toggle_linewise_current)", utils.var.opt)
