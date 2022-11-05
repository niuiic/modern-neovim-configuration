local utils = require("utils")

utils.fn.require("luasnip.config").setup({
	history = true,
	update_events = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged",
	ext_opts = {
		[utils.fn.require("luasnip.util.types").choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	ext_base_prio = 200,
	ext_prio_increase = 1,
	enable_autosnippets = true,
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})

-- keymap
utils.fn.map("i", "<A-j>", "<Cmd>lua require('luasnip').expand_or_jump()<CR>", utils.var.opt)
utils.fn.map("i", "<A-k>", "<Cmd>lua require('luasnip').jump(-1)<CR>", utils.var.opt)
utils.fn.map("s", "<A-j>", "<Cmd>lua require('luasnip').jump(1)<CR>", utils.var.opt)
utils.fn.map("s", "<A-k>", "<Cmd>lua require('luasnip').jump(-1)<CR>", utils.var.opt)
