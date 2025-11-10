vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

-- exit and refresh
vim.keymap.set("n", "<A-q>", "<cmd>q!<cr>", { silent = true })
vim.keymap.set("n", "<C-e>", function()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	vim.cmd("e")
	vim.api.nvim_win_set_cursor(0, cursor_pos)
end, { silent = true })
vim.api.nvim_create_user_command("Quit", function()
	local function delete_invalid_buffer(bufnr)
		if not require("tools.buffer_valid")(bufnr) then
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
vim.keymap.set({ "i", "n", "x" }, "<C-h>", "<esc>", { noremap = true, silent = true })

-- copy to systemclip
vim.keymap.set("x", "Y", '"+y<esc>', { silent = true })

-- toggle current fold
vim.keymap.set("n", "Z", "za", { silent = true })

-- center this line
vim.keymap.set("n", "e", "zz", { silent = true })

-- plugin operation
require("which-key").add({
	{ "<leader>n", group = "neovim" },
	{ "<leader>np", "<cmd>Lazy<cr>", desc = "plugin management" },
	{ "<leader>nl", "<cmd>LspInfo<cr>", desc = "lsp status" },
	{ "<leader>nc", "<cmd>checkhealth<cr>", desc = "checkhealth" },
	{ "<leader>nt", "<cmd>TSUpdate<cr>", desc = "update language parsers of nvim-treesitter" },
	{ "<leader>nr", "<cmd>LspRestart<cr>", desc = "restart all lsp" },
	{ "<leader>nm", "<cmd>messages<cr>", desc = "show messages" },
	{ "<leader>nM", "<cmd>messages clear<cr>", desc = "clear messages" },
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
vim.keymap.set({ "n", "v" }, "<C-f>", function()
	require("tools.quick_print")()
end)

-- new comment line
vim.keymap.set({ "n" }, "<C-y>", function()
	local lnum = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, lnum, lnum, false, { "" })

	local commentstring = vim.api.nvim_get_option_value("commentstring", { buf = 0 })
	if vim.bo.filetype == "vue" then
		local node = vim.treesitter.get_node()
		while node do
			if string.find(node:sexpr(), "(script_element", 1, true) == 1 then
				commentstring = "// %s"
				break
			elseif string.find(node:sexpr(), "(template_element", 1, true) == 1 then
				commentstring = "<!-- %s -->"
				break
			elseif string.find(node:sexpr(), "(style_element", 1, true) == 1 then
				commentstring = "// %s"
				break
			end

			node = node:parent()
		end
		if commentstring == "" then
			commentstring = string.format(commentstring, " $1")
		end
	end
	commentstring = string.format(commentstring, " $1")

	vim.api.nvim_win_set_cursor(0, { lnum + 1, 0 })
	vim.snippet.expand(string.format("\n%s\n$2", commentstring))
end, { silent = true })

-- comment
vim.keymap.set({ "n", "x" }, "<C-a>", function()
	vim.cmd("normal gcc")
end, { silent = true })

-- tab
vim.keymap.set("i", "<C-d>", "\t", { silent = true })
vim.keymap.set("i", "<C-u>", "<C-d>", { silent = true })
