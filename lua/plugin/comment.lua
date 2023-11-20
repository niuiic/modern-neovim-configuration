local config = function()
	vim.g.skip_ts_context_commentstring_module = true

	require("ts_context_commentstring").setup({
		enable_autocmd = false,
		config = {
			scss = "/* %s */",
		},
	})

	local calc_vue_commentstring = function()
		local default_commentstring = "<!-- %s -->"
		local ts_utils = require("nvim-treesitter.ts_utils")

		local current_node = ts_utils.get_node_at_cursor()
		if not current_node then
			return default_commentstring
		end

		local node = current_node
		while node do
			if node:type() == "stylesheet" then
				return "/* %s */"
			elseif node:type() == "program" then
				return "// %s"
			elseif node:type() == "component" then
				return "<!-- %s -->"
			end
			if node:parent() then
				node = node:parent()
			else
				return default_commentstring
			end
		end
	end

	require("Comment").setup({
		mappings = {
			basic = true,
			extra = false,
			extended = false,
		},
		ignore = "^$",
		pre_hook = function(ctx)
			if vim.bo.filetype == "vue" then
				return calc_vue_commentstring()
			else
				return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()(ctx)
			end
		end,
	})
end

return {
	config = config,
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	keys = {
		{ "<C-a>", "<Plug>(comment_toggle_linewise_visual)", mode = "v" },
		{ "<C-a>", "<Plug>(comment_toggle_linewise_current)" },
	},
}
