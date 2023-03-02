vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

-- exit and refresh
vim.keymap.set("n", "<C-q>", ":q<CR>", { silent = true })
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

-- save
vim.keymap.set("n", "<C-s>", ":SaveAndSaveQf<CR>", { silent = true })
vim.keymap.set("n", "<A-s>", ":wa!<CR>", { silent = true })

-- esc
vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

-- delete buffer
vim.keymap.set("n", "<C-x>", function()
	local bufnr = vim.api.nvim_win_get_buf(0)
	local wins = vim.api.nvim_list_wins()
	local validWins = {}
	for _, winnr in ipairs(wins) do
		local success, bufnr2 = pcall(vim.api.nvim_win_get_buf, winnr)
		if success then
			if bufnr == bufnr2 then
				table.insert(validWins, winnr)
			else
				local buf_name = vim.api.nvim_buf_get_name(bufnr2)
				if buf_name ~= nil and buf_name ~= '' then
					table.insert(validWins, winnr)
				end
			end
		end
	end
	if table.maxn(validWins) > 1 then
		vim.ui.select({ "Yes", "No" }, { prompt = "close current window together" }, function(choice)
			if choice == "No" then
				local emptyBufnr = vim.api.nvim_create_buf(false, true)
				vim.api.nvim_win_set_buf(0, emptyBufnr)
				pcall(vim.api.nvim_buf_delete, bufnr, {})
			elseif choice == "Yes" then
				pcall(vim.api.nvim_buf_delete, bufnr, {})
			end
		end)
	else
		pcall(vim.api.nvim_buf_delete, bufnr, {})
	end
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

-- set to center
vim.keymap.set("n", "Z", "zz", { silent = true })

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
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
