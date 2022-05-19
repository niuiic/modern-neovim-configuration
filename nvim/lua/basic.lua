local au = vim.api.nvim_create_autocmd

-- file encoding
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- no compatible to vi
vim.g.nocompatible = true

-- avoid unnecessary redrawing
vim.g.lazyredraw = true

-- highlight current line
vim.wo.cursorline = true

-- show sign column on the left
vim.wo.signcolumn = "yes"

-- termguicolors
vim.opt.termguicolors = true

-- show line number
vim.wo.number = true

-- tab length
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- tab => space
vim.o.expandtab = true
vim.bo.expandtab = true

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

-- no wrap
vim.wo.wrap = false

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

-- dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"

-- filetype
local setFiletype = function(pattern, filetype)
	au({ "BufNewFile", "BufRead" }, {
		pattern = { pattern },
		callback = function()
			vim.bo.filetype = filetype
		end,
	})
end
setFiletype("*.sv", "systemverilog")
setFiletype("*.h", "c")
setFiletype("*.hpp", "cpp")
setFiletype("*.cpp", "cpp")
setFiletype("*.v", "verilog")
setFiletype("*.asm", "asm")
setFiletype("*.s", "asm")

-- python
vim.g.python3_host_prog = "/usr/bin/python"

-- quickfix
au({ "VimEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.bo.makeprg = "make"
	end,
})
