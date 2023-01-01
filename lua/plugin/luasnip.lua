local config = function()
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
			return vim.split(vim.bo.filetype, ".", { plain = true })
		end,
	})
end

-- keymap
local keys = {
	{
		"<A-j>",
		function()
			require("luasnip").expand_or_jump()
		end,
		mode = "i",
	},
	{
		"<A-k>",
		function()
			require("luasnip").jump(-1)
		end,
		mode = "i",
	},
	{
		"<A-j>",
		function()
			require("luasnip").jump(1)
		end,
		mode = "s",
	},
	{
		"<A-k>",
		function()
			require("luasnip").jump(-1)
		end,
		mode = "s",
	},
}

return {
	config = config,
	keys = keys,
	lazy = false,
}
