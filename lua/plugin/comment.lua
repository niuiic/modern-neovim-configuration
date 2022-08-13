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
	pre_hook = function(ctx)
		if vim.bo.filetype == "vue" then
			local U = utils.fn.require("Comment.utils")

			-- Determine whether to use linewise or blockwise commentstring
			local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

			-- Determine the location where to calculate commentstring from
			local location = nil
			if ctx.ctype == U.ctype.blockwise then
				location = utils.fn.require("ts_context_commentstring.utils").get_cursor_location()
			elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
				location = utils.fn.require("ts_context_commentstring.utils").get_visual_start_location()
			end

			return utils.fn.require("")("ts_context_commentstring.internal").calculate_commentstring({
				key = type,
				location = location,
			})
		end
	end,
})

local ft = utils.fn.require("Comment.ft")
ft({ "go", "rust", "javascript", "typescript" }, "//%s")
ft({ "lua" }, "--%s")

-- keymap
utils.fn.map("v", "<C-a>", "<Plug>(comment_toggle_linewise_visual)", utils.var.opt)
utils.fn.map("n", "<C-a>", "<Plug>(comment_toggle_linewise_current)", utils.var.opt)
