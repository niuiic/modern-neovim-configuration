-- find more awesome plugins
-- https://github.com/rockerBOO/awesome-neovim
-- http://neovimcraft.com
-- https://github.com/ayamir/nvimdots/wiki/Plugins

local utils = require("utils")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
	-- shortcut suggestions
	utils.fn.load_plugin_config("folke/which-key.nvim", "plugin/which-key"),
	-- auto complete pairs
	utils.fn.load_plugin_config("windwp/nvim-autopairs", "plugin/nvim-autopairs"),
	-- automatically switch input method when input mode changed
	utils.fn.load_plugin_config("alohaia/fcitx.nvim", "plugin/fcitx"),
	-- displays neovim startup time
	utils.fn.load_plugin_config("dstein64/vim-startuptime", "plugin/vim-startuptime"),
	-- fold
	utils.fn.load_plugin_config("anuvyklack/pretty-fold.nvim", "plugin/pretty-fold"),
	-- lazygit
	utils.fn.load_plugin_config("kdheepak/lazygit.nvim", "plugin/lazygit"),
	-- terminal
	utils.fn.load_plugin_config("akinsho/toggleterm.nvim", "plugin/toggleterm"),
	-- toggle comments
	utils.fn.load_plugin_config("numToStr/Comment.nvim", "plugin/comment"),
	-- dashboard
	utils.fn.load_plugin_config("glepnir/dashboard-nvim", "plugin/dashboard-nvim"),
	-- automatically toggle between absolute line number and relative one
	"sitiom/nvim-numbertoggle",

	-- quick motion
	utils.fn.load_plugin_config("ggandor/leap.nvim", "plugin/leap"),
	"phaazon/hop.nvim",

	-- session
	utils.fn.load_plugin_config("rmagatti/auto-session", "plugin/auto-session"),
	-- file tree
	utils.fn.load_plugin_config("kyazdani42/nvim-tree.lua", "plugin/nvim-tree"),

	-- better syntax highlight
	utils.fn.load_plugin_config("nvim-treesitter/nvim-treesitter", "plugin/nvim-treesitter"),
	-- extensions
	-- rainbow brackets
	"p00f/nvim-ts-rainbow",
	utils.fn.load_plugin_config("m-demare/hlargs.nvim", "plugin/hlargs"),
	-- better matchup
	"andymass/vim-matchup",
	-- syntax aware text-objects, select, move, swap, and peek support
	"nvim-treesitter/nvim-treesitter-textobjects",
	-- auto complete tag in html
	utils.fn.load_plugin_config("windwp/nvim-ts-autotag", "plugin/nvim-ts-autotag"),

	-- sql
	utils.fn.load_plugin_config("nanotee/sqls.nvim", "plugin/sqls"),

	-- code auto complete
	-- engine
	utils.fn.load_plugin_config("hrsh7th/nvim-cmp", "plugin/nvim-cmp"),
	-- better ui
	utils.fn.load_plugin_config("onsails/lspkind-nvim", "plugin/lspkind-nvim"),
	-- tools
	"lukas-reineke/cmp-under-comparator",
	-- source
	-- more sources on https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"dmitmel/cmp-cmdline-history",
	"lukas-reineke/cmp-rg",
	-- snippets
	utils.fn.load_plugin_config("L3MON4D3/LuaSnip", "plugin/luasnip"),
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- status line
	utils.fn.load_plugin_config("nvim-lualine/lualine.nvim", "plugin/lualine"),
	-- undotree
	utils.fn.load_plugin_config("jiaoshijie/undotree", "plugin/undotree"),
	-- a pretty diagnostics, references, telescope results, quickfix and location list
	utils.fn.load_plugin_config("folke/trouble.nvim", "plugin/trouble"),
	-- quickly modify surround char
	utils.fn.load_plugin_config("kylechui/nvim-surround", "plugin/nvim-surround"),
	-- call sudo in neovim
	utils.fn.load_plugin_config("lambdalisue/suda.vim", "plugin/suda"),
	-- close buffer
	utils.fn.load_plugin_config("kazhala/close-buffers.nvim", "plugin/close-buffers"),
	-- more smooth scroll
	utils.fn.load_plugin_config("karb94/neoscroll.nvim", "plugin/neoscroll"),
	-- highlights cursor words and lines
	utils.fn.load_plugin_config("yamatsum/nvim-cursorline", "plugin/nvim-cursorline"),

	-- debug
	utils.fn.load_plugin_config("mfussenegger/nvim-dap", "plugin/nvim-dap"),
	"mxsdev/nvim-dap-vscode-js",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",
	"ofirgall/goto-breakpoints.nvim",
	"jbyuki/one-small-step-for-vimkind",

	-- unit test
	utils.fn.load_plugin_config("nvim-neotest/neotest", "plugin/neotest"),
	-- colorscheme
	utils.fn.load_plugin_config("folke/tokyonight.nvim", "plugin/tokyonight"),
	-- git signs
	utils.fn.load_plugin_config("lewis6991/gitsigns.nvim", "plugin/gitsigns"),
	-- resolve git conflict
	utils.fn.load_plugin_config("akinsho/git-conflict.nvim", "plugin/git-conflict"),
	-- color picker & colorizer
	utils.fn.load_plugin_config("uga-rosa/ccc.nvim", "plugin/ccc"),
	-- indentation guides
	utils.fn.load_plugin_config("lukas-reineke/indent-blankline.nvim", "plugin/indent-blankline"),
	-- tab line
	utils.fn.load_plugin_config("akinsho/bufferline.nvim", "plugin/bufferline"),
	-- git diff gui
	utils.fn.load_plugin_config("sindrets/diffview.nvim", "plugin/diffview"),
	-- just use as a formatter manager now
	utils.fn.load_plugin_config("jose-elias-alvarez/null-ls.nvim", "plugin/null-ls"),

	-- fuzzy search
	utils.fn.load_plugin_config("nvim-telescope/telescope.nvim", "plugin/telescope"),
	-- extensions
	-- yank
	utils.fn.load_plugin_config("gbprod/yanky.nvim", "plugin/yanky"),
	-- todo comments
	utils.fn.load_plugin_config("folke/todo-comments.nvim", "plugin/todo-comments"),
	-- project manager
	utils.fn.load_plugin_config("ahmedkhalf/project.nvim", "plugin/project"),

	-- task manager
	utils.fn.load_plugin_config("stevearc/overseer.nvim", "plugin/overseer"),

	-- lsp
	"neovim/nvim-lspconfig",
	utils.fn.load_plugin_config("glepnir/lspsaga.nvim", "plugin/lspsaga"),
	-- code action
	"weilbith/nvim-code-action-menu",

	-- lsp, dap, linter, formatter installer
	utils.fn.load_plugin_config("williamboman/mason.nvim", "plugin/mason"),
	-- search and replace in project
	utils.fn.load_plugin_config("windwp/nvim-spectre", "plugin/nvim-spectre"),
	-- buffer / mark / tabpage / colorscheme switcher
	utils.fn.load_plugin_config("toppair/reach.nvim", "plugin/reach"),
	-- annotation generator
	utils.fn.load_plugin_config("danymat/neogen", "plugin/neogen"),
	-- move lines and blocks
	utils.fn.load_plugin_config("fedepujol/move.nvim", "plugin/move"),
	-- highlight current n
	utils.fn.load_plugin_config("rktjmp/highlight-current-n.nvim", "plugin/highlight-current-n"),
	-- cursor position
	utils.fn.load_plugin_config("gen740/SmoothCursor.nvim", "plugin/smooth-cursor"),
	-- tag bar
	utils.fn.load_plugin_config("simrat39/symbols-outline.nvim", "plugin/symbols-outline"),
	-- pretty ui
	utils.fn.load_plugin_config("folke/noice.nvim", "plugin/noice"),
	-- macro
	utils.fn.load_plugin_config("chrisgrieser/nvim-recorder", "plugin/nvim-recorder"),
	-- crate
	utils.fn.load_plugin_config("saecki/crates.nvim", "plugin/crates"),
	-- js/ts package info
	utils.fn.load_plugin_config("vuki656/package-info.nvim", "plugin/package-info"),
	-- divider line
	utils.fn.load_plugin_config("niuiic/divider.nvim", "plugin/divider"),
	-- clipboard image
	utils.fn.load_plugin_config("niuiic/cp-image.nvim", "plugin/cp-image"),
	-- translate
	utils.fn.load_plugin_config("niuiic/translate.nvim", "plugin/translate"),
})
