local utils = require("utils")

utils.fn.require("nvim-treesitter.configs").setup({
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})

local calc_vue_commentstring = function()
	local default_commentstring = "<!-- %s -->"
	local ts_utils = utils.fn.require("nvim-treesitter.ts_utils")

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

utils.fn.require("Comment").setup({
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
			return utils.fn.require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()(ctx)
		end
	end,
})

utils.fn.map("v", "<C-a>", "<Plug>(comment_toggle_linewise_visual)", utils.var.opt)
utils.fn.map("n", "<C-a>", "<Plug>(comment_toggle_linewise_current)", utils.var.opt)
