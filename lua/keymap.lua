local core = require("core")
local utils = require("utils")

vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

-- exit and refresh
vim.keymap.set("n", "<A-q>", ":q!<CR>", { silent = true })
vim.keymap.set("n", "<C-n>", function()
	vim.ui.select({ "Window", "Buffer", "Both" }, { prompt = "Windows or Buffers to clear" }, function(choice)
		if not choice then
			return
		end
		if choice == "Window" then
			vim.cmd("only")
		elseif choice == "Buffer" then
			local bufnr = vim.api.nvim_win_get_buf(0)
			core.lua.list.each(vim.api.nvim_list_bufs(), function(buf)
				if buf ~= bufnr then
					pcall(require("mini.bufremove").delete, buf)
				end
			end)
		else
			local bufnr = vim.api.nvim_win_get_buf(0)
			core.lua.list.each(vim.api.nvim_list_bufs(), function(buf)
				if buf ~= bufnr then
					pcall(require("mini.bufremove").delete, buf)
				end
			end)
			vim.cmd("only")
		end
	end)
end, { silent = true })
vim.keymap.set("n", "<C-e>", function()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	vim.cmd("e")
	vim.api.nvim_win_set_cursor(0, cursor_pos)
end, { silent = true })
vim.api.nvim_create_user_command("Quit", function()
	core.lua.list.each(vim.api.nvim_list_bufs(), function(bufnr)
		if not utils.buffer_valid(bufnr) then
			---@diagnostic disable-next-line: param-type-mismatch
			pcall(vim.cmd, "bw! " .. bufnr)
		end
	end)
	vim.cmd("qa")
end, {})
vim.keymap.set("n", "<C-q>", ":Quit<CR>", { silent = true })

-- save
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
vim.keymap.set("n", "<A-s>", ":wa!<CR>", { silent = true })

-- esc
vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

-- delete buffer
vim.keymap.set("n", "<C-x>", function()
	require("mini.bufremove").delete()
end, {})

-- copy to systemclip
vim.keymap.set("x", "Y", '"+y<Esc>', { silent = true })

-- toggle current fold
vim.keymap.set("n", "Z", "za", { silent = true })

-- center this line
vim.keymap.set("n", "e", "zz", { silent = true })

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
