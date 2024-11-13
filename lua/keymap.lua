vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

-- exit and refresh
vim.keymap.set("n", "<A-q>", "<cmd>q!<cr>", { silent = true })
vim.keymap.set("n", "<C-n>", function()
	pcall(function()
		vim.cmd("only")
	end)
end, { silent = true })
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
vim.keymap.set({ "i", "n", "x" }, "<C-c>", "<Esc>", { silent = true })

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
	local text = vim.iter(require("omega").get_selection() or { "" }):join("\n")
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
	{ "<leader>np", "<cmd>Lazy<cr>", desc = "plugin management" },
	{ "<leader>nl", "<cmd>LspInfo<cr>", desc = "lsp status" },
	{ "<leader>nc", "<cmd>checkhealth<cr>", desc = "checkhealth" },
	{ "<leader>nt", "<cmd>TSUpdate<cr>", desc = "update language parsers of nvim-treesitter" },
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

-- run lua file
vim.keymap.set({ "n", "x" }, "<C-b>", function()
	if vim.bo.filetype == "lua" then
		require("omega").dofile(vim.api.nvim_buf_get_name(0))
	end
end)

-- quick print
vim.keymap.set({ "n", "x" }, "<C-f>", function()
	require("tools.quick_print")()
end)

-- vim.keymap.set({ "n" }, "<C-v>", function()
-- 	local async = vim.uv.new_async(vim.schedule_wrap(function(x)
-- 		print(x)
-- 	end))
--
-- 	vim.uv.new_thread(function(handle)
-- 		handle:send("hello")
-- 	end, async)
-- end)
