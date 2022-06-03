-- find more awesome plugins
-- https://github.com/rockerBOO/awesome-neovim
-- http://neovimcraft.com
-- https://github.com/ayamir/nvimdots/wiki/Plugins

require("packer").startup({
	function(use)
		-- plugin manager (basically configured)
		use("wbthomason/packer.nvim")
		-- todo comments (not work correctly)
		use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
		-- status line (basically configured)
		use({
			"nvim-lualine/lualine.nvim",
			requires = {
				"folke/tokyonight.nvim",
				"kyazdani42/nvim-web-devicons",
				-- show lsp status
				"arkav/lualine-lsp-progress",
				-- show current function name
				"SmiteshP/nvim-gps",
				-- requirement of nvim-gps
				"nvim-treesitter/nvim-treesitter",
				opt = true,
			},
		})
		-- terminal (basically configured)
		use({
			"akinsho/toggleterm.nvim",
			tag = "v1.*",
		})
		-- displays neovim startup time
		use("dstein64/vim-startuptime")
		-- toggle comments (basically configured)
		use("numToStr/Comment.nvim")
		-- undotree
		use("jiaoshijie/undotree")
		-- a pretty diagnostics, references, telescope results, quickfix and location list (basically configured)
		use({
			"folke/trouble.nvim",
			requires = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
		})
		-- quickly modify surround char
		use("ur4ltz/surround.nvim")
		-- call sudo in neovim (fully configured)
		use("lambdalisue/suda.vim")
		-- project manager (basically configured)
		use({ "ahmedkhalf/project.nvim", requires = "nvim-telescope/telescope.nvim" })
		-- dashboard (fully configured)
		use("glepnir/dashboard-nvim")
		-- highlights cursor words and lines
		use("yamatsum/nvim-cursorline")
		-- more smooth scroll (fully configured)
		use("karb94/neoscroll.nvim")
		-- expand and repeat expression to multiple lines (fully configured)
		use("AllenDang/nvim-expand-expr")
		-- quick motion
		use({
			"phaazon/hop.nvim",
			config = function()
				require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			end,
		})
		-- shortcut suggestions (basically configured)
		use("folke/which-key.nvim")
		use("honza/vim-snippets")
		-- auto complete pairs
		use("windwp/nvim-autopairs")
		-- automatically switch input method when input mode changed (fully configured)
		use("alohaia/fcitx.nvim")
		-- unit test
		use({
			"rcarriga/vim-ultest",
			requires = { "vim-test/vim-test" },
			run = ":UpdateRemotePlugins",
		})
		-- repeat previous cmd
		use("tpope/vim-repeat")
		-- git signs
		use("lewis6991/gitsigns.nvim")
		-- a faster version of filetype.vim
		use("nathom/filetype.nvim")
		-- aysnc tasks
		use({
			"skywind3000/asynctasks.vim",
			requires = {
				"skywind3000/asyncrun.vim",
			},
		})
		-- colorscheme (fully configured)
		use("folke/tokyonight.nvim")
		-- zoom
		use("dhruvasagar/vim-zoom")
		-- always show code context
		use({ "nvim-treesitter/nvim-treesitter-context", requires = { "nvim-treesitter/nvim-treesitter" } })
		-- better syntax highlight
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			requires = { "p00f/nvim-ts-rainbow", "andymass/vim-matchup" },
		})
		-- automatically toggle between absolute line number and relative one
		use("jeffkreeftmeijer/vim-numbertoggle")
		-- indentation guides
		use("lukas-reineke/indent-blankline.nvim")
		-- tab line (basically configured)
		use({
			"akinsho/bufferline.nvim",
			tag = "v2.*",
			requires = "kyazdani42/nvim-web-devicons",
		})
		-- debugger
		use("puremourning/vimspector")
		-- git diff gui
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
		-- colorizer (basically configured)
		use("norcalli/nvim-colorizer.lua")
		-- translate
		use("uga-rosa/translate.nvim")
		-- just use as a formatter manager now (continue to configure)
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = "nvim-lua/plenary.nvim",
		})
		-- fuzzy search (cannot search quickfix)
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})
		-- file tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			tag = "nightly",
		})
		-- lsp manager
		use({
			"williamboman/nvim-lsp-installer",
			"neovim/nvim-lspconfig",
		})
		-- for better lsp ui
		use({ "onsails/lspkind-nvim", "tami5/lspsaga.nvim" })
		-- tagbar
		use("simrat39/symbols-outline.nvim")
		-- code auto complete
		use({
			-- engine
			"hrsh7th/nvim-cmp",
			-- source
			-- more sources on https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			-- snippets
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		})
		-- yank
		use("gbprod/yanky.nvim")
		-- debug
		use({
			"mfussenegger/nvim-dap",
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
		})
		-- sql
		use({ "nanotee/sqls.nvim", ft = { "sql" } })
		-- fold
		use({
			"anuvyklack/pretty-fold.nvim",
			requires = {
				-- only for preview
				"anuvyklack/nvim-keymap-amend",
			},
		})
		-- session
		use("rmagatti/auto-session")
		-- run code snip
		use({ "michaelb/sniprun", run = "bash ./install.sh" })
		-- lazygit
		use("kdheepak/lazygit.nvim")
	end,
})
