-- find more awesome plugins
-- https://github.com/rockerBOO/awesome-neovim
-- http://neovimcraft.com
-- https://github.com/ayamir/nvimdots/wiki/Plugins

local utils = require("utils")

require("packer").startup({
	function(use)
		-- plugin manager
		use("wbthomason/packer.nvim")
		-- shortcut suggestions
		use({ "folke/which-key.nvim", config = utils.fn.load_config({ "plugin/which-key" }) })
		-- auto complete pairs
		use({ "windwp/nvim-autopairs", config = utils.fn.load_config({ "plugin/nvim-autopairs" }) })
		-- automatically switch input method when input mode changed
		use({ "alohaia/fcitx.nvim", config = utils.fn.load_config({ "plugin/fcitx" }) })
		-- displays neovim startup time
		use({ "dstein64/vim-startuptime", config = utils.fn.load_config({ "plugin/vim-startuptime" }) })
		-- a faster version of filetype.vim
		use({ "nathom/filetype.nvim", config = utils.fn.load_config({ "plugin/filetype" }) })
		-- fold
		use({
			"anuvyklack/pretty-fold.nvim",
			requires = { "anuvyklack/keymap-amend.nvim", "anuvyklack/fold-preview.nvim" },
			config = utils.fn.load_config({ "plugin/pretty-fold" }),
		})
		-- repeat previous cmd
		use("tpope/vim-repeat")
		-- lazygit
		use({ "kdheepak/lazygit.nvim", config = utils.fn.load_config({ "plugin/lazygit" }) })
		-- terminal
		use({
			"akinsho/toggleterm.nvim",
			config = utils.fn.load_config({ "plugin/toggleterm" }),
		})
		-- tagbar
		use({ "simrat39/symbols-outline.nvim", config = utils.fn.load_config({ "plugin/symbols-outline" }) })
		-- toggle comments
		use({
			"numToStr/Comment.nvim",
			requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
			config = utils.fn.load_config({ "plugin/comment" }),
		})
		-- dashboard
		use({ "glepnir/dashboard-nvim", config = utils.fn.load_config({ "plugin/dashboard-nvim" }) })
		-- automatically toggle between absolute line number and relative one
		use({
			"sitiom/nvim-numbertoggle",
			config = utils.fn.load_config({ "plugin/numbertoggle" }),
		})
		-- quick motion
		use({
			"ggandor/lightspeed.nvim",
			config = utils.fn.load_config({ "plugin/lightspeed" }),
		})
		-- session
		use({ "rmagatti/auto-session", config = utils.fn.load_config({ "plugin/auto-session" }) })
		-- file tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			config = utils.fn.load_config({ "plugin/nvim-tree" }),
		})
		-- better syntax highlight
		use({
			{
				"nvim-treesitter/nvim-treesitter",
				run = ":TSUpdate",
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
		})
		-- sql
		use({ "nanotee/sqls.nvim", opt = true, ft = "sql", config = utils.fn.load_config({ "plugin/sqls" }) })
		-- code auto complete
		use({
			-- engine
			{
				"hrsh7th/nvim-cmp",
				requires = {
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
		})
		-- lsp status
		use({
			"j-hui/fidget.nvim",
			config = utils.fn.load_config({ "plugin/fidget" }),
		})
		-- status line
		use({
			"nvim-lualine/lualine.nvim",
			requires = {
				"folke/tokyonight.nvim",
				"kyazdani42/nvim-web-devicons",
			},
			config = utils.fn.load_config({ "plugin/lualine" }),
		})
		-- undotree
		use({ "jiaoshijie/undotree", config = utils.fn.load_config({ "plugin/undotree" }) })
		-- run code snip
		use({ "michaelb/sniprun", run = "bash ./install.sh", config = utils.fn.load_config({ "plugin/sniprun" }) })
		-- a pretty diagnostics, references, telescope results, quickfix and location list
		use({

			{
				"folke/trouble.nvim",
				requires = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
				config = utils.fn.load_config({ "plugin/trouble" }),
			},
			{
				"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
				config = utils.fn.load_config({ "plugin/lsp_lines" }),
			},
		})
		-- quickly modify surround char
		use({ "kylechui/nvim-surround", config = utils.fn.load_config({ "plugin/nvim-surround" }) })
		-- call sudo in neovim
		use({ "lambdalisue/suda.vim", config = utils.fn.load_config({ "plugin/suda" }) })
		-- close buffer
		use({ "kazhala/close-buffers.nvim", config = utils.fn.load_config({ "plugin/close-buffers" }) })
		-- translate
		use({
			"uga-rosa/translate.nvim",
			config = utils.fn.load_config({ "plugin/translate" }),
		})
		-- more smooth scroll
		use({ "karb94/neoscroll.nvim", config = utils.fn.load_config({ "plugin/neoscroll" }) })
		-- highlights cursor words and lines
		use({ "yamatsum/nvim-cursorline", config = utils.fn.load_config({ "plugin/nvim-cursorline" }) })
		-- debug
		use({
			{ "mfussenegger/nvim-dap", config = utils.fn.load_config({ "plugin/nvim-dap", "debugger" }) },
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"ofirgall/goto-breakpoints.nvim",
		})
		-- expand and repeat expression to multiple lines
		use({ "AllenDang/nvim-expand-expr", config = utils.fn.load_config({ "plugin/nvim-expand-expr" }) })
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
			config = utils.fn.load_config({ "plugin/neotest" }),
		})
		-- colorscheme
		use({ "folke/tokyonight.nvim", config = utils.fn.load_config({ "plugin/tokyonight" }) })
		-- git signs
		use({ "lewis6991/gitsigns.nvim", config = utils.fn.load_config({ "plugin/gitsigns" }) })
		-- resolve git conflict
		use({ "akinsho/git-conflict.nvim", config = utils.fn.load_config({ "plugin/git-conflict" }) })
		-- color picker & colorizer
		use({ "uga-rosa/ccc.nvim", config = utils.fn.load_config({ "plugin/ccc" }) })
		-- indentation guides
		use({ "lukas-reineke/indent-blankline.nvim", config = utils.fn.load_config({ "plugin/indent-blankline" }) })
		-- tab line
		use({
			"akinsho/bufferline.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = utils.fn.load_config({ "plugin/bufferline" }),
		})
		-- git diff gui
		use({
			"sindrets/diffview.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = utils.fn.load_config({ "plugin/diffview" }),
		})
		-- just use as a formatter manager now
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = utils.fn.load_config({ "plugin/null-ls" }),
		})
		-- fuzzy search
		use({
			{
				"nvim-telescope/telescope.nvim",
				requires = { "nvim-lua/plenary.nvim" },
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
				requires = "nvim-lua/plenary.nvim",
				config = utils.fn.load_config({ "plugin/todo-comments" }),
			},
			-- project manager
			{ "ahmedkhalf/project.nvim", config = utils.fn.load_config({ "plugin/project" }) },
		})
		-- task manager
		use({
			"stevearc/overseer.nvim",
			config = utils.fn.load_config({ "plugin/overseer" }),
		})
		-- spell check
		use({
			"lewis6991/spellsitter.nvim",
			config = utils.fn.load_config({ "plugin/spellsitter" }),
		})
		-- lsp
		use({
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
		})
		-- lsp, dap, linter, formatter installer
		use({
			"williamboman/mason.nvim",
			config = utils.fn.load_config({ "plugin/mason" }),
		})
		-- search and replace in project
		use({
			"windwp/nvim-spectre",
			requires = "nvim-lua/plenary.nvim",
			config = utils.fn.load_config({ "plugin/nvim-spectre" }),
		})
		-- glsl viewer
		use({
			"timtro/glslView-nvim",
			ft = "glsl",
			config = utils.fn.load_config({ "plugin/glsl-view" }),
		})
		-- buffer / mark / tabpage / colorscheme switcher
		use({
			"toppair/reach.nvim",
			config = utils.fn.load_config({ "plugin/reach" }),
		})
		-- annotation generator
		use({
			"danymat/neogen",
			requires = "nvim-treesitter/nvim-treesitter",
			config = utils.fn.load_config({ "plugin/neogen" }),
		})
		-- move lines and blocks
		use({ "fedepujol/move.nvim", config = utils.fn.load_config({ "plugin/move" }) })
		-- highlight current n
		use({ "rktjmp/highlight-current-n.nvim", config = utils.fn.load_config({ "plugin/highlight-current-n" }) })
	end,
})
