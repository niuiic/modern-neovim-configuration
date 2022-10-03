local utils = require("utils")

-- FIXME: not worked in vue files
utils.fn.require("nvim-treesitter.configs").setup({
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			vue = {
				__default = "<!-- %s -->",
				html = "<!-- %s -->",
				style = "/* %s */",
				script = "// %s",
				comment = "<!-- %s -->",
			},
		},
	},
})

utils.fn.require("Comment").setup({
	mappings = {
		basic = true,
		extra = false,
		extended = false,
	},
	ignore = "^$",
	pre_hook = utils.fn.require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

utils.fn.map("v", "<C-a>", "<Plug>(comment_toggle_linewise_visual)", utils.var.opt)
utils.fn.map("n", "<C-a>", "<Plug>(comment_toggle_linewise_current)", utils.var.opt)
