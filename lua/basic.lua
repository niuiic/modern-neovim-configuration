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

-- show line number
vim.wo.number = true

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

-- auto save and load fold state
local isWinValid = function(file_name)
	if file_name == "" then
		return false
	end
	local invalidList = {
		[[term://]],
		"NvimTree",
		"toggleterm",
		"Trouble",
		"spectre_panel",
		"OverseerList",
	}
	for _, val in pairs(invalidList) do
		if string.find(file_name, val) then
			return false
		end
	end
	return true
end
vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*",
	callback = function(args)
		if isWinValid(args.file) then
			vim.cmd([[mkview 1]])
		end
	end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function(args)
		if isWinValid(args.file) then
			vim.cmd([[silent! loadview 1]])
		end
	end,
})
