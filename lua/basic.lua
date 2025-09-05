-- file encoding
vim.g.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

-- no compatible to vi
vim.g.nocompatible = true

-- avoid unnecessary redrawing
vim.g.lazyredraw = true

-- show sign column on the left
vim.wo.signcolumn = "yes"

-- termguicolors
vim.opt.termguicolors = true

-- tab width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- tab => space
vim.opt.expandtab = true

-- auto indent
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

-- cmd line height
vim.o.cmdheight = 2

-- auto reload file when it is changed from outside
vim.o.autoread = true
vim.bo.autoread = true

-- auto wrap
vim.wo.wrap = true

-- no swap file and backup
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- smaller updatetime
vim.o.updatetime = 300

-- smaller timeoutlen
vim.o.timeoutlen = 300

-- split window will appear at bottom and right
vim.o.splitbelow = true
vim.o.splitright = true

-- more powerful auto completion
vim.o.wildmenu = true

-- python
vim.g.python3_host_prog = "/usr/bin/python"

-- enable mouse mode
vim.o.mouse = "a"

-- fold
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.api.nvim_create_autocmd("BufWinLeave", {
	callback = function()
		pcall(function()
			vim.cmd("silent! mkview")
		end)
	end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function()
		pcall(function()
			vim.cmd("silent! loadview")
		end)
	end,
})

-- filetype
vim.filetype.add({
	extension = {
		ebuild = "sh",
		zsh = "sh",
		glsl = "glsl",
		wgsl = "wgsl",
		mdx = "markdown",
		ts = "typescript",
		todo = "todo",
		http = "http",
		d2 = "d2",
		puml = "plantuml",
	},
	pattern = {
		["TODO"] = "todo",
	},
})

-- yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		local higroup = vim.fn.hlexists("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"
		vim.highlight.on_yank({ higroup = higroup, timeout = 500 })
	end,
})

-- snippet
vim.api.nvim_set_hl(0, "SnippetTabstop", {})

-- statusline
vim.o.statusline = "%f"
vim.schedule(function()
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#666666", bold = true })
	vim.api.nvim_set_hl(0, "StatusLine", { fg = "#00ffff", bold = true })
end)
local disabled_filetypes = {
	"NvimTree",
	"terminal",
	"trouble",
	"divider",
	"lspsagaoutline",
	"dapui_scopes",
	"dapui_breakpoints",
	"dapui_stacks",
	"dapui_watches",
	"dap-repl",
	"dapui_console",
	"track",
	"Avante",
	"AvanteInput",
	"buffers",
	"",
}
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.bo.filetype == "" or vim.list_contains(disabled_filetypes, vim.bo.filetype) then
			vim.wo.statusline = " "
		else
			vim.wo.statusline = "%f"
		end
	end,
})

-- line number
vim.wo.number = true
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local options = { "number", "relativenumber" }
		vim.iter(options):each(function(option)
			vim.api.nvim_set_option_value(
				option,
				not vim.list_contains(disabled_filetypes, vim.bo.filetype),
				{ win = vim.api.nvim_get_current_win() }
			)
		end)
	end,
})

-- clipboard
if vim.fn.getenv("WSL_INTEROP") ~= vim.NIL then
	vim.cmd([[
        let g:clipboard = {
          \   'name': 'WslClipboard',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }
    ]])
end

-- commentstring
local commentstrings = {
	mermaid = "%% %s",
	d2 = "# %s",
	plantuml = "/' %s '/",
}

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
		if commentstrings[filetype] then
			vim.api.nvim_set_option_value("commentstring", commentstrings[filetype], { buf = args.buf })
		end
	end,
})
