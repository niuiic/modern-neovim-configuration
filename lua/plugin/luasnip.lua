local utils = require("utils")

require("luasnip.config").setup({
	history = true,
	update_events = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged",
	ext_opts = {
		[require("luasnip.util.types").choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	ext_base_prio = 200,
	ext_prio_increase = 1,
	enable_autosnippets = true,
	ft_func = function()
		return vim.split(vim.bo.filetype, ".")
	end,
})

-- keymap
vim.keymap.set("i", "<A-j>", "<Cmd>lua require('luasnip').expand_or_jump()<CR>", { silent = true })
vim.keymap.set("i", "<A-k>", "<Cmd>lua require('luasnip').jump(-1)<CR>", { silent = true })
vim.keymap.set("s", "<A-j>", "<Cmd>lua require('luasnip').jump(1)<CR>", { silent = true })
vim.keymap.set("s", "<A-k>", "<Cmd>lua require('luasnip').jump(-1)<CR>", { silent = true })
