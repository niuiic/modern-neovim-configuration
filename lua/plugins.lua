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
	{ "folke/which-key.nvim", config = utils.fn.load_config({ "plugin/which-key" }) },
	-- auto complete pairs
	{ "windwp/nvim-autopairs", config = utils.fn.load_config({ "plugin/nvim-autopairs" }) },
	-- automatically switch input method when input mode changed
	{ "alohaia/fcitx.nvim", config = utils.fn.load_config({ "plugin/fcitx" }) },
	-- displays neovim startup time
	{ "dstein64/vim-startuptime", config = utils.fn.load_config({ "plugin/vim-startuptime" }) },
	-- fold
	{
		"anuvyklack/pretty-fold.nvim",
		dependencies = { "anuvyklack/keymap-amend.nvim", "anuvyklack/fold-preview.nvim" },
		config = utils.fn.load_config({ "plugin/pretty-fold" }),
	},
	-- repeat previous cmd
	"tpope/vim-repeat",
	-- lazygit
	{ "kdheepak/lazygit.nvim", config = utils.fn.load_config({ "plugin/lazygit" }) },
	-- terminal
	{
		"akinsho/toggleterm.nvim",
		config = utils.fn.load_config({ "plugin/toggleterm" }),
	},
	-- toggle comments
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = utils.fn.load_config({ "plugin/comment" }),
	},
	-- dashboard
	{ "glepnir/dashboard-nvim", config = utils.fn.load_config({ "plugin/dashboard-nvim" }) },
	-- automatically toggle between absolute line number and relative one
	"sitiom/nvim-numbertoggle",

	-- quick motion
	-- group
	{ "ggandor/leap.nvim", config = utils.fn.load_config({ "plugin/leap" }) },
	"phaazon/hop.nvim",
	-- end

	-- session
	{ "rmagatti/auto-session", config = utils.fn.load_config({ "plugin/auto-session" }) },
	-- file tree
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = utils.fn.load_config({ "plugin/nvim-tree" }),
	},

	-- better syntax highlight
	-- group
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = utils.fn.load_config({ "plugin/nvim-treesitter" }),
	},
	-- extensions
	-- rainbow brackets
	"p00f/nvim-ts-rainbow",
	{ "m-demare/hlargs.nvim", config = utils.fn.load_config({ "plugin/hlargs" }) },
	-- better matchup
	"andymass/vim-matchup",
	-- syntax aware text-objects, select, move, swap, and peek support
	"nvim-treesitter/nvim-treesitter-textobjects",
	-- auto complete tag in html
	{
		"windwp/nvim-ts-autotag",
		config = utils.fn.load_config({ "plugin/nvim-ts-autotag" }),
	},
	-- end

	-- sql
	{ "nanotee/sqls.nvim", ft = "sql", config = utils.fn.load_config({ "plugin/sqls" }) },

	-- code auto complete
	-- group
	-- engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- better ui
			{ "onsails/lspkind-nvim", config = utils.fn.load_config({ "plugin/lspkind-nvim" }) },
		},
		config = utils.fn.load_config({ "plugin/nvim-cmp" }),
	},
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
	{ "L3MON4D3/LuaSnip", config = utils.fn.load_config({ "plugin/luasnip" }) },
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	-- end

	-- status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"folke/tokyonight.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = utils.fn.load_config({ "plugin/lualine" }),
	},
	-- undotree
	{
		"jiaoshijie/undotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = utils.fn.load_config({ "plugin/undotree" }),
	},
	-- a pretty diagnostics, references, telescope results, quickfix and location list
	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
		config = utils.fn.load_config({ "plugin/trouble" }),
	},
	-- quickly modify surround char
	{ "kylechui/nvim-surround", config = utils.fn.load_config({ "plugin/nvim-surround" }) },
	-- call sudo in neovim
	{ "lambdalisue/suda.vim", config = utils.fn.load_config({ "plugin/suda" }) },
	-- close buffer
	{ "kazhala/close-buffers.nvim", config = utils.fn.load_config({ "plugin/close-buffers" }) },
	-- more smooth scroll
	{ "karb94/neoscroll.nvim", config = utils.fn.load_config({ "plugin/neoscroll" }) },
	-- highlights cursor words and lines
	{ "yamatsum/nvim-cursorline", config = utils.fn.load_config({ "plugin/nvim-cursorline" }) },

	-- debug
	-- group
	{ "mfussenegger/nvim-dap", config = utils.fn.load_config({ "plugin/nvim-dap", "debugger" }) },
	"mxsdev/nvim-dap-vscode-js",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",
	"ofirgall/goto-breakpoints.nvim",
	"jbyuki/one-small-step-for-vimkind",
	-- end

	-- expand and repeat expression to multiple lines
	{ "AllenDang/nvim-expand-expr", config = utils.fn.load_config({ "plugin/nvim-expand-expr" }) },
	-- unit test
	{
		"nvim-neotest/neotest",
		dependencies = {
			-- "nvim-treesitter/nvim-treesitter" is required
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			-- adapters
			-- check more adapters on https://github.com/nvim-neotest/neotest#supported-runners
			"haydenmeade/neotest-jest",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-vim-test",
		},
		config = utils.fn.load_config({ "plugin/neotest" }),
	},
	-- colorscheme
	{ "folke/tokyonight.nvim", config = utils.fn.load_config({ "plugin/tokyonight" }) },
	-- git signs
	{ "lewis6991/gitsigns.nvim", config = utils.fn.load_config({ "plugin/gitsigns" }) },
	-- resolve git conflict
	{ "akinsho/git-conflict.nvim", config = utils.fn.load_config({ "plugin/git-conflict" }) },
	-- color picker & colorizer
	{
		"uga-rosa/ccc.nvim",
		config = utils.fn.load_config({ "plugin/ccc" }),
	},
	-- indentation guides
	{ "lukas-reineke/indent-blankline.nvim", config = utils.fn.load_config({ "plugin/indent-blankline" }) },
	-- tab line
	{
		"akinsho/bufferline.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = utils.fn.load_config({ "plugin/bufferline" }),
	},
	-- git diff gui
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = utils.fn.load_config({ "plugin/diffview" }),
	},
	-- just use as a formatter manager now
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = utils.fn.load_config({ "plugin/null-ls" }),
	},

	-- fuzzy search
	-- group
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = utils.fn.load_config({ "plugin/telescope" }),
	},
	-- extensions
	-- yank
	{
		"gbprod/yanky.nvim",
		config = utils.fn.load_config({ "plugin/yanky" }),
	},
	-- todo comments
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = utils.fn.load_config({ "plugin/todo-comments" }),
	},
	-- project manager
	{ "ahmedkhalf/project.nvim", config = utils.fn.load_config({ "plugin/project" }) },
	-- end

	-- task manager
	{
		"stevearc/overseer.nvim",
		config = utils.fn.load_config({ "plugin/overseer" }),
	},

	-- lsp
	-- group
	{
		"neovim/nvim-lspconfig",
		config = utils.fn.load_config({ "lsp" }),
	},
	{
		"glepnir/lspsaga.nvim",
		config = utils.fn.load_config({ "plugin/lspsaga" }),
	},
	-- code action
	"weilbith/nvim-code-action-menu",
	-- end

	-- lsp, dap, linter, formatter installer
	{
		"williamboman/mason.nvim",
		config = utils.fn.load_config({ "plugin/mason" }),
	},
	-- search and replace in project
	{
		"windwp/nvim-spectre",
		dependencies = "nvim-lua/plenary.nvim",
		config = utils.fn.load_config({ "plugin/nvim-spectre" }),
	},
	-- buffer / mark / tabpage / colorscheme switcher
	{
		"toppair/reach.nvim",
		config = utils.fn.load_config({ "plugin/reach" }),
	},
	-- annotation generator
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = utils.fn.load_config({ "plugin/neogen" }),
	},
	-- move lines and blocks
	{ "fedepujol/move.nvim", config = utils.fn.load_config({ "plugin/move" }) },
	-- highlight current n
	{ "rktjmp/highlight-current-n.nvim", config = utils.fn.load_config({ "plugin/highlight-current-n" }) },
	-- cursor position
	{
		"gen740/SmoothCursor.nvim",
		config = utils.fn.load_config({ "plugin/smooth-cursor" }),
	},
	-- tag bar
	{
		"simrat39/symbols-outline.nvim",
		config = utils.fn.load_config({ "plugin/symbols-outline" }),
	},
	-- pretty ui
	{
		"folke/noice.nvim",
		config = utils.fn.load_config({ "plugin/noice" }),
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	-- macro
	{
		"chrisgrieser/nvim-recorder",
		config = utils.fn.load_config({ "plugin/nvim-recorder" }),
	},
})
