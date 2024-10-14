local utils = require("utils")

vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

-- exit and refresh
vim.keymap.set("n", "<A-q>", "<cmd>q!<cr>", { silent = true })
vim.keymap.set("n", "<C-n>", "<cmd>only<cr>", { silent = true })
vim.keymap.set("n", "<C-e>", function()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	vim.cmd("e")
	vim.api.nvim_win_set_cursor(0, cursor_pos)
end, { silent = true })
vim.api.nvim_create_user_command("Quit", function()
	local function delete_invalid_buffer(bufnr)
		if not utils.buffer_valid(bufnr) then
			pcall(function()
				vim.cmd("bw! " .. bufnr)
			end)
		end
	end
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		delete_invalid_buffer(bufnr)
	end
	vim.cmd("qa")
end, {})
vim.keymap.set("n", "<C-q>", "<cmd>Quit<cr>", { silent = true })

-- save
vim.keymap.set("n", "<C-s>", ":silent w<cr>", { silent = true })
vim.keymap.set("n", "<A-s>", ":silent wa!<cr>", { silent = true })

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

-- calc max node id
vim.keymap.set("x", "<C-p>", function()
	local text = (require("omega").get_selection() or { "" })[1]
	local max = "1"
	---@diagnostic disable-next-line: param-type-mismatch
	for id in string.gmatch(text, "n([%d]+)") do
		if tonumber(id) > tonumber(max) then
			max = id
		end
	end
	vim.notify(max, vim.log.levels.INFO)
	require("omega").to_normal_mode()
end, { silent = true })

-- plugin operation
require("which-key").add({
	{ "<leader>n", group = "neovim" },
	{
		"<C-f>",
		function()
			if vim.bo.filetype == "lua" then
				require("omega").dofile(vim.api.nvim_buf_get_name(0))
			end
		end,
		mode = { "n", "x" },
		desc = "run lua file",
	},
	{ "<leader>np", "<cmd>Lazy<cr>", desc = "plugin management" },
	{ "<leader>nl", "<cmd>LspInfo<cr>", desc = "lsp status" },
	{ "<leader>nc", "<cmd>checkhealth<cr>", desc = "checkhealth" },
	{ "<leader>nt", "<cmd>TSUpdate<cr>", desc = "update language parsers of nvim-treesitter" },
	{ "<leader>nm", "<cmd>messages<cr>", desc = "show messages" },
	{
		"<leader>nd",
		function()
			require("osv").launch({ port = 8086 })
		end,
		desc = "debug neovim",
	},
	{
		"<leader>nD",
		function()
			require("osv").run_this()
		end,
		desc = "debug neovim (run this)",
	},
})

-- quick print
local count = 0
local symbol = "QUICK_PRINT"
local get_expr_prev = function()
	count = count + 1
	local lnum = vim.api.nvim_win_get_cursor(0)[1]
	local file_name = vim.api.nvim_buf_get_name(0)
	return string.format("%s(%s)[%s:%s]", symbol, count, file_name, lnum)
end
local js = function(selection, expr_prev)
	return string.format([[console.log("%s %s = ", %s)]], expr_prev, selection, selection)
end
local lua = function(selection, expr_prev)
	return string.format([[print("%s %s = ", vim.inspect(%s))]], expr_prev, selection, selection)
end
local get_print_expr = function(selection, expr_prev)
	local getters = {
		javascript = js,
		javascriptreact = js,
		typescript = js,
		typescriptreact = js,
		vue = js,
		lua = lua,
	}

	local getter = getters[vim.bo.filetype] or getters["default"]
	return getter(selection, expr_prev)
end
vim.keymap.set({ "n", "x" }, "<C-b>", function()
	local selection = require("omega").get_selection()[1]
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local print_expr = get_print_expr(selection, get_expr_prev())
	vim.api.nvim_buf_set_lines(0, cursor_pos[1], cursor_pos[1], false, { print_expr })
	require("omega").to_normal_mode()
	vim.api.nvim_win_set_cursor(0, { cursor_pos[1] + 1, cursor_pos[2] })
end)
