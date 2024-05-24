local utils = require("utils")

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

-- line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd("ModeChanged", {
	callback = function()
		local mode = vim.fn.mode()
		if mode == "i" then
			vim.opt.number = true
			vim.opt.relativenumber = false
		else
			vim.opt.number = true
			vim.opt.relativenumber = true
		end
	end,
})

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

-- fix the delay to enter normal mode in sql file
vim.g.omni_sql_no_default_maps = 1

-- enable mouse mode
vim.o.mouse = "a"

-- fold
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.api.nvim_create_autocmd("BufWinLeave", {
	callback = function(args)
		if utils.buffer_valid(args.buf) then
			vim.cmd("mkview")
		end
	end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function(args)
		if utils.buffer_valid(args.buf) then
			vim.cmd("silent! loadview")
		end
	end,
})

-- filetype
vim.filetype.add({
	extension = {
		sh = "sh",
		ebuild = "sh",
		vert = "glsl",
		tesc = "glsl",
		tese = "glsl",
		geom = "glsl",
		frag = "glsl",
		comp = "glsl",
		rgen = "glsl",
		rint = "glsl",
		rahit = "glsl",
		rchit = "glsl",
		rmiss = "glsl",
		rcall = "glsl",
		wgsl = "wgsl",
		mdx = "markdown",
		typ = "typst",
		zsh = "sh",
		ts = "typescript",
	},
})

-- yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		local higroup = vim.fn.hlexists("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"
		vim.highlight.on_yank({ higroup = higroup, timeout = 500 })
	end,
})

-- switch normal mode when enter window
vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function(args)
		if vim.fn.mode() == "i" and utils.buffer_valid(args.buf) then
			vim.cmd("stopinsert")
		end
	end,
})
