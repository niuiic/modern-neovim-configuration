local core = require("niuiic-core")

vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

-- exit and refresh
vim.keymap.set("n", "<A-q>", ":q!<CR>", { silent = true })
vim.keymap.set("n", "<C-n>", ":only<CR>", { silent = true })
vim.keymap.set("n", "<C-e>", function()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	if vim.lsp.get_active_clients() ~= nil then
		vim.diagnostic.reset()
	end
	vim.cmd("e")
	vim.api.nvim_win_set_cursor(0, cursor_pos)
end, { silent = true })
local buffer_valid = function(bufnr)
	local root_path = core.file.root_path()
	local success, name = pcall(vim.api.nvim_buf_get_name, bufnr)
	if not success or name == nil or name == "" or string.find(name, root_path, 1, true) ~= 1 then
		return false
	end
	return true
end
vim.keymap.set("n", "<C-q>", function()
	local buf_list = core.lua.list.filter(vim.api.nvim_list_bufs(), function(v)
		return not buffer_valid(v)
	end)
	for _, bufnr in ipairs(buf_list) do
		pcall(vim.api.nvim_buf_delete, bufnr, {})
	end
	vim.cmd("q")
end, { silent = true })

-- save
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
vim.keymap.set("n", "<A-s>", ":wa!<CR>", { silent = true })

-- esc
vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

-- delete buffer
vim.keymap.set("n", "<C-x>", function()
	local root_path = core.file.root_path()
	local bufnr = vim.api.nvim_win_get_buf(0)
	local success, name = pcall(vim.api.nvim_buf_get_name, bufnr)
	if success and name ~= nil and string.find(name, root_path, 1, true) ~= nil then
		local next_buf
		local find_target = false
		core.lua.list.each(vim.api.nvim_list_bufs(), function(v)
			if v == bufnr then
				find_target = true
				return
			end
			if not buffer_valid(v) then
				return
			end
			if not find_target or next_buf == nil then
				next_buf = v
			end
		end)
		if next_buf then
			vim.api.nvim_win_set_buf(0, next_buf)
		end
	end
	pcall(vim.api.nvim_buf_delete, bufnr, {})
end, {})

-- quickfix
require("which-key").register({
	q = {
		name = "quickfix",
		o = {
			"<cmd>cope25<CR>",
			"open quickfix window",
		},
		m = {
			"<cmd>make<CR>",
			"make",
		},
		c = {
			"<cmd>cclose<CR>",
			"close quickfix window",
		},
		e = {
			"<cmd>set modifiable<CR>",
			"set quickfix modifiable",
		},
		r = {
			"<cmd>LoadQf<CR>",
			"load quickfix history",
		},
		w = {
			"<cmd>WriteQf<CR>",
			"save quickfix",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
vim.keymap.set("n", "<A-j>", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "<A-k>", ":cprev<CR>", { silent = true })

-- copy to systemclip
vim.keymap.set("x", "Y", '"+y<Esc>', { silent = true })

-- toggle current fold
vim.keymap.set("n", "Z", "za", { silent = true })

-- plugin operation
require("which-key").register({
	n = {
		name = "neovim",
		p = {
			"<cmd>Lazy<CR>",
			"plugin management",
		},
		l = {
			"<cmd>LspInfo<CR>",
			"lsp status",
		},
		c = {
			"<cmd>checkhealth<CR>",
			"checkhealth",
		},
		t = {
			"<cmd>TSUpdate<CR>",
			"update language parsers of nvim-treesitter",
		},
		m = {
			"<cmd>messages<CR>",
			"show messages",
		},
		d = {
			function()
				require("osv").launch({ port = 8086 })
			end,
			"debug neovim",
		},
		D = {
			function()
				require("osv").run_this()
			end,
			"debug neovim (run this)",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
