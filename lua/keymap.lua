local utils = require("utils")

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
	vim.api.nvim_command("e")
	vim.api.nvim_win_set_cursor(0, cursor_pos)
end, { silent = true })

-- save
vim.keymap.set("n", "<C-s>", ":SaveAndSaveQf<CR>", { silent = true })
vim.keymap.set("n", "<A-s>", ":wa!<CR>", { silent = true })

-- esc
vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

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
vim.keymap.set("n", "<A-g>", ":cfirst<CR>", { silent = true })
vim.keymap.set("n", "<A-G>", ":clast<CR>", { silent = true })

-- copy to systemclip
vim.keymap.set("x", "Y", '"+y<Esc>', { silent = true })

-- unmap
vim.keymap.set("n", "gd", "", { silent = true })

-- plugin operation
require("which-key").register({
	p = {
		name = "plugin",
		u = {
			"<cmd>PackerSync<CR>",
			"update plugins",
		},
		l = {
			"<cmd>LspInfo<CR>",
			"lsp info",
		},
		i = {
			"<cmd>Mason<CR>",
			"lsp install info",
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
				require("osv").run_this()
			end,
			"debug neovim",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
