-- find more awesome plugins
-- https://github.com/rockerBOO/awesome-neovim
-- http://neovimcraft.com
-- https://github.com/ayamir/nvimdots/wiki/Plugins

local utils = require("utils")

require("packer").startup({
	function(use)
		-- plugin manager (basically configured)
		use("wbthomason/packer.nvim")
		-- shortcut suggestions (basically configured)
		use({ "folke/which-key.nvim", config = utils.fn.loadConfig({ "plugin/which-key" }) })
		-- auto complete pairs
		use({ "windwp/nvim-autopairs", config = utils.fn.loadConfig({ "plugin/nvim-autopairs" }) })
		-- automatically switch input method when input mode changed (fully configured)
		use({ "alohaia/fcitx.nvim", config = utils.fn.loadConfig({ "plugin/fcitx" }) })
		-- displays neovim startup time
		use({ "dstein64/vim-startuptime", config = utils.fn.loadConfig({ "plugin/vim-startuptime" }) })
		-- a faster version of filetype.vim
		use({ "nathom/filetype.nvim", config = utils.fn.loadConfig({ "plugin/filetype" }) })
		-- fold
		use({
			"anuvyklack/pretty-fold.nvim",
			requires = {
				-- only for preview
				"anuvyklack/nvim-keymap-amend",
			},
			config = utils.fn.loadConfig({ "plugin/pretty-fold" }),
		})
		-- repeat previous cmd
		use("tpope/vim-repeat")
		-- lazygit
		use({ "kdheepak/lazygit.nvim", config = utils.fn.loadConfig({ "plugin/lazygit" }) })
		-- terminal (basically configured)
		use({
			"akinsho/toggleterm.nvim",
			tag = "v1.*",
			config = utils.fn.loadConfig({ "plugin/toggleterm" }),
		})
		-- tagbar
		use({ "simrat39/symbols-outline.nvim", config = utils.fn.loadConfig({ "plugin/symbols-outline" }) })
		-- toggle comments (basically configured)
		use({ "numToStr/Comment.nvim", config = utils.fn.loadConfig({ "plugin/comment" }) })
		-- dashboard (fully configured)
		use({ "glepnir/dashboard-nvim", config = utils.fn.loadConfig({ "plugin/dashboard-nvim" }) })
		-- automatically toggle between absolute line number and relative one
		use("jeffkreeftmeijer/vim-numbertoggle")
		-- quick motion
		use({
			"phaazon/hop.nvim",
			config = utils.fn.loadConfig({ "plugin/hop" }),
		})
		-- session
		use({ "rmagatti/auto-session", config = utils.fn.loadConfig({ "plugin/auto-session" }) })
		-- file tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			tag = "nightly",
			config = utils.fn.loadConfig({ "plugin/nvim-tree" }),
		})
		-- better syntax highlight
		use({
			{
				"nvim-treesitter/nvim-treesitter",
				run = ":TSUpdate",
				config = utils.fn.loadConfig({ "plugin/nvim-treesitter" }),
			},
			-- extensions
			-- rainbow brackets
			"p00f/nvim-ts-rainbow",
			-- better matchup
			"andymass/vim-matchup",
			-- always show code context
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = utils.fn.loadConfig({ "plugin/nvim-treesitter-context" }),
			},
			-- syntax aware text-objects, select, move, swap, and peek support
			"nvim-treesitter/nvim-treesitter-textobjects",
		})
		-- sql
		use({ "nanotee/sqls.nvim", opt = true, ft = "sql", config = utils.fn.loadConfig({ "plugin/sqls" }) })
		-- code auto complete
		use({
			-- engine
			{
				"hrsh7th/nvim-cmp",
				requires = {
					-- better ui
					{ "onsails/lspkind-nvim", config = utils.fn.loadConfig({ "plugin/lspkind-nvim" }) },
				},
				config = utils.fn.loadConfig({ "plugin/nvim-cmp" }),
			},
			-- source
			-- more sources on https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			-- snippets
			{ "L3MON4D3/LuaSnip", config = utils.fn.loadConfig({ "plugin/luasnip" }) },
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		})
		-- status line (basically configured)
		use({
			"nvim-lualine/lualine.nvim",
			requires = {
				"folke/tokyonight.nvim",
				"kyazdani42/nvim-web-devicons",
				-- show lsp status
				"arkav/lualine-lsp-progress",
				-- show current function name
				{
					"SmiteshP/nvim-gps",
					-- "nvim-treesitter/nvim-treesitter" is required
					config = utils.fn.loadConfig({ "plugin/nvim-gps" }),
				},
			},
			config = utils.fn.loadConfig({ "plugin/lualine" }),
		})
		-- undotree
		use({ "jiaoshijie/undotree", config = utils.fn.loadConfig({ "plugin/undotree" }) })
		-- run code snip
		use({ "michaelb/sniprun", run = "bash ./install.sh", config = utils.fn.loadConfig({ "plugin/sniprun" }) })
		-- a pretty diagnostics, references, telescope results, quickfix and location list (basically configured)
		use({
			"folke/trouble.nvim",
			requires = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
			config = utils.fn.loadConfig({ "plugin/trouble" }),
		})
		-- quickly modify surround char
		use({ "ur4ltz/surround.nvim", config = utils.fn.loadConfig({ "plugin/surround" }) })
		-- call sudo in neovim (fully configured)
		use({ "lambdalisue/suda.vim", config = utils.fn.loadConfig({ "plugin/suda" }) })
		-- translate
		use({ "uga-rosa/translate.nvim", config = utils.fn.loadConfig({ "plugin/translate" }) })
		-- more smooth scroll (fully configured)
		use({ "karb94/neoscroll.nvim", config = utils.fn.loadConfig({ "plugin/neoscroll" }) })
		-- highlights cursor words and lines
		use({ "yamatsum/nvim-cursorline", config = utils.fn.loadConfig({ "plugin/nvim-cursorline" }) })
		-- debug
		use({
			{ "mfussenegger/nvim-dap", config = utils.fn.loadConfig({ "plugin/nvim-dap" }) },
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
		})
		-- expand and repeat expression to multiple lines (fully configured)
		use({ "AllenDang/nvim-expand-expr", config = utils.fn.loadConfig({ "plugin/nvim-expand-expr" }) })
		-- unit test
		use({
			"nvim-neotest/neotest",
			requires = {
				-- "nvim-treesitter/nvim-treesitter" is required
				"nvim-lua/plenary.nvim",
				"antoinemadec/FixCursorHold.nvim",
				-- adapters
				-- check more adapters on https://github.com/nvim-neotest/neotest#supported-runners
				"haydenmeade/neotest-jest",
				"nvim-neotest/neotest-go",
				"nvim-neotest/neotest-vim-test",
			},
			config = utils.fn.loadConfig({ "plugin/neotest" }),
		})
		-- colorscheme (fully configured)
		use("folke/tokyonight.nvim")
		-- git signs
		use({ "lewis6991/gitsigns.nvim", config = utils.fn.loadConfig({ "plugin/gitsigns" }) })
		-- resolve git conflict
		use({ "akinsho/git-conflict.nvim", config = utils.fn.loadConfig({ "plugin/git-conflict" }) })
		-- colorizer (basically configured)
		use({ "norcalli/nvim-colorizer.lua", config = utils.fn.loadConfig({ "plugin/nvim-colorizer" }) })
		-- indentation guides
		use({ "lukas-reineke/indent-blankline.nvim", config = utils.fn.loadConfig({ "plugin/indent-blankline" }) })
		-- tab line (basically configured)
		use({
			"akinsho/bufferline.nvim",
			tag = "v2.*",
			requires = "kyazdani42/nvim-web-devicons",
			config = utils.fn.loadConfig({ "plugin/bufferline" }),
		})
		-- git diff gui
		use({
			"sindrets/diffview.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = utils.fn.loadConfig({ "plugin/diffview" }),
		})
		-- just use as a formatter manager now (continue to configure)
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = utils.fn.loadConfig({ "plugin/null-ls" }),
		})
		-- fuzzy search (basically configured)
		use({
			{
				"nvim-telescope/telescope.nvim",
				requires = { "nvim-lua/plenary.nvim" },
				config = utils.fn.loadConfig({ "plugin/telescope" }),
			},
			-- extensions
			-- yank
			{
				"gbprod/yanky.nvim",
				config = utils.fn.loadConfig({ "plugin/yanky" }),
			},
			-- todo comments
			{
				"folke/todo-comments.nvim",
				requires = "nvim-lua/plenary.nvim",
				config = utils.fn.loadConfig({ "plugin/todo-comments" }),
			},
			-- project manager (basically configured)
			{ "ahmedkhalf/project.nvim", config = utils.fn.loadConfig({ "plugin/project" }) },
		})
		-- aysnc tasks
		use({
			{
				"skywind3000/asynctasks.vim",
				requires = {
					"skywind3000/asyncrun.vim",
				},
				config = utils.fn.loadConfig({ "plugin/asynctasks" }),
			},
			-- search tasks with telescope
			{ "GustavoKatel/telescope-asynctasks.nvim" },
		})
		-- lsp
		use({
			{
				"williamboman/nvim-lsp-installer",
				config = utils.fn.loadConfig({ "plugin/nvim-lsp-installer" }),
			},
			{
				"neovim/nvim-lspconfig",
				config = utils.fn.loadConfig({ "lsp" }),
			},
			{
				"kkharji/lspsaga.nvim",
				config = utils.fn.loadConfig({ "plugin/lspsaga" }),
			},
		})
	end,
})
