local utils = require("utils")

require("lspsaga").init_lsp_saga({
	move_in_saga = { prev = "<C-b>", next = "<C-f>" },
	finder_action_keys = {
		open = "<cr>",
		vsplit = "v",
		split = "s",
		tabe = "t",
		quit = "<esc>",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	code_action_keys = {
		quit = "<esc>",
		exec = "<CR>",
	},
	rename_action_quit = "<esc>",
	symbol_in_winbar = {
		in_custom = true,
		click_support = function(node, clicks, button, modifiers)
			-- To see all avaiable details: vim.pretty_print(node)
			local st = node.range.start
			local en = node.range["end"]
			if button == "l" then
				if clicks == 2 then
				-- double left click to do nothing
				else -- jump to node's starting line+char
					vim.fn.cursor(st.line + 1, st.character + 1)
				end
			elseif button == "r" then
				if modifiers == "s" then
					print("lspsaga") -- shift right click to print "lspsaga"
				end -- jump to node's ending line+char
				vim.fn.cursor(en.line + 1, en.character + 1)
			elseif button == "m" then
				-- middle click to visual select node
				vim.fn.cursor(st.line + 1, st.character + 1)
				vim.api.nvim_command("normal v")
				vim.fn.cursor(en.line + 1, en.character + 1)
			end
		end,
	},
})

--symbols in winbar
local function get_file_name(include_path)
	local file_name = require("lspsaga.symbolwinbar").get_file_name()
	if vim.fn.bufname("%") == "" then
		return ""
	end
	if include_path == false then
		return file_name
	end
	-- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
	local sep = vim.loop.os_uname().sysname == "Windows" and "\\" or "/"
	local path_list = vim.split(string.gsub(vim.fn.expand("%:~:.:h"), "%%", ""), sep)
	local file_path = ""
	for _, cur in ipairs(path_list) do
		file_path = (cur == "." or cur == "~") and "" or file_path .. cur .. " " .. "%#LspSagaWinbarSep#>%*" .. " %*"
	end
	return file_path .. file_name
end

local function config_winbar()
	if vim.bo.filetype ~= "vue" then
		local exclude = {
			["teminal"] = true,
			["toggleterm"] = true,
			["prompt"] = true,
			["NvimTree"] = true,
			["help"] = true,
		} -- Ignore float windows and exclude filetype
		if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
			vim.wo.winbar = ""
		else
			local ok, lspsaga = pcall(require, "lspsaga.symbolwinbar")
			local sym
			if ok then
				sym = lspsaga.get_symbol_node()
			end
			local win_val = ""
			win_val = get_file_name(true) -- set to true to include path
			if sym ~= nil then
				win_val = win_val .. sym
			end
			vim.wo.winbar = win_val
		end
	end
end

local events = { "BufEnter", "BufWinEnter", "CursorMoved" }

vim.api.nvim_create_autocmd(events, {
	pattern = "*",
	callback = function()
		config_winbar()
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "LspsagaUpdateSymbol",
	callback = function()
		config_winbar()
	end,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- keymap
local telescope_builtin = require("telescope.builtin")
require("which-key").register({
	g = {
		f = {
			function()
				telescope_builtin.lsp_references()
			end,
			"find lsp_references",
		},
		m = {
			function()
				telescope_builtin.lsp_implementations()
			end,
			"find lsp_implementations",
		},
		d = {
			function()
				telescope_builtin.lsp_definitions()
			end,
			"find lsp_definitions",
		},
		D = {
			function()
				telescope_builtin.lsp_type_definitions()
			end,
			"find lsp_type_definitions",
		},
		s = {
			function()
				telescope_builtin.lsp_document_symbols()
			end,
			"find lsp_document_symbols",
		},
		S = {
			function()
				telescope_builtin.lsp_workspace_symbols()
			end,
			"find lsp_workspace_symbols",
		},
		h = {
			"<cmd>Lspsaga signature_help<CR>",
			"find signature_help",
		},
		j = {
			function()
				vim.diagnostic.goto_next({ float = false })
			end,
			"jump to next diagnostic",
		},
		k = {
			function()
				vim.diagnostic.goto_prev({ float = false })
			end,
			"jump to previous diagnostic",
		},
		J = {
			function()
				vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, float = false })
			end,
			"jump to next error",
		},
		K = {
			function()
				vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, float = false })
			end,
			"jump to previous error",
		},
		T = {
			function()
				require("todo-comments").jump_prev()
			end,
			"jump to previous todo comment",
		},
		t = {
			function()
				require("todo-comments").jump_next()
			end,
			"jump to next todo comment",
		},
	},
}, {
	mode = "n",
})

vim.keymap.set("n", "J", ":lua vim.lsp.buf.hover()<CR>", { silent = true })
vim.keymap.set("n", "D", ":lua vim.diagnostic.open_float()<CR>", { silent = true })
vim.keymap.set("n", "K", ":Lspsaga peek_definition<CR>", { silent = true })
