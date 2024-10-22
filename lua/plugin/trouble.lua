local config = function()
	require("trouble").setup({
		modes = {
			quickfix = {
				win = {
					type = "split",
					position = "bottom",
					relative = "editor",
					size = { height = (vim.opt.lines:get() - vim.opt.cmdheight:get()) / 2 },
				},
			},
			symbols = {
				win = {
					type = "split",
					position = "right",
					relative = "editor",
					size = { width = 50 },
				},
			},
		},
		keys = {
			j = "next",
			k = "prev",
			Z = "fold_toggle",
		},
	})
end

local on_list = function(options)
	local item_set = {}
	for _, item in ipairs(options.items) do
		local key = string.format("%s:%s:%s", item.filename, item.lnum, item.col)
		item_set[key] = item
	end

	vim.fn.setloclist(0, {}, "r", {
		context = options.context,
		items = vim.tbl_values(item_set),
	})
	require("trouble").open({ mode = "loclist" })
end

local keys = {
	{
		"gf",
		function()
			vim.lsp.buf.references(nil, { on_list = on_list })
		end,
		desc = "goto references",
	},
	{
		"gi",
		function()
			vim.lsp.buf.implementation({
				on_list = on_list,
			})
		end,
		desc = "goto implements",
	},
	{
		"gd",
		function()
			vim.lsp.buf.definition({
				on_list = on_list,
			})
		end,
		desc = "goto definitions",
	},
	{
		"<A-j>",
		function()
			pcall(require("trouble").next, { skip_groups = true, jump = true })
		end,
		desc = "jump to next item",
	},
	{
		"<A-k>",
		function()
			pcall(require("trouble").prev, { skip_groups = true, jump = true })
		end,
		desc = "jump to previous item",
	},
}

return {
	config = config,
	keys = keys,
	dependencies = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
}
