-- find more awesome plugins
-- https://github.com/rockerBOO/awesome-neovim
-- http://neovimcraft.com
-- https://github.com/ayamir/nvimdots/wiki/Plugins

local load_plugin_config = function(plugin, config_path)
	local success, config = pcall(require, config_path)
	if not success or config == nil then
		vim.notify("Error: failed to load config " .. config_path, vim.log.levels.ERROR)
		return {}
	end
	table.insert(config, 1, plugin)
	return config
end

local load_dev_plugin_config = function(plugin, config_path)
	if config_path == nil then
		return {
			dir = plugin,
			dev = true,
		}
	end
	local success, config = pcall(require, config_path)
	if not success or config == nil then
		vim.notify("Error: failed to load config " .. config_path, vim.log.levels.ERROR)
		return {}
	end
	config.dir = plugin
	config.dev = true
	return config
end

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
	load_plugin_config("folke/which-key.nvim", "plugin/which-key"),
	-- dev doc
	load_plugin_config("folke/neodev.nvim", "plugin/neodev"),
	-- auto complete pairs
	load_plugin_config("windwp/nvim-autopairs", "plugin/nvim-autopairs"),
	-- automatically switch input method when input mode changed
	load_plugin_config("alohaia/fcitx.nvim", "plugin/fcitx"),
	-- displays neovim startup time
	load_plugin_config("dstein64/vim-startuptime", "plugin/vim-startuptime"),
	-- fold
	load_plugin_config("kevinhwang91/nvim-ufo", "plugin/nvim-ufo"),
	-- lazygit
	load_plugin_config("kdheepak/lazygit.nvim", "plugin/lazygit"),
	-- terminal
	load_plugin_config("akinsho/toggleterm.nvim", "plugin/toggleterm"),
	-- toggle comments
	load_plugin_config("numToStr/Comment.nvim", "plugin/comment"),
	-- automatically toggle between absolute line number and relative one
	"sitiom/nvim-numbertoggle",
	-- quick motion
	load_plugin_config("ggandor/leap.nvim", "plugin/leap"),
	-- file tree
	load_plugin_config("kyazdani42/nvim-tree.lua", "plugin/nvim-tree"),

	-- better syntax highlight
	load_plugin_config("nvim-treesitter/nvim-treesitter", "plugin/nvim-treesitter"),
	-- extensions
	-- rainbow brackets
	"p00f/nvim-ts-rainbow",
	load_plugin_config("m-demare/hlargs.nvim", "plugin/hlargs"),
	-- better matchup
	"andymass/vim-matchup",
	-- syntax aware text-objects, select, move, swap, and peek support
	"nvim-treesitter/nvim-treesitter-textobjects",
	-- auto complete tag in html
	load_plugin_config("windwp/nvim-ts-autotag", "plugin/nvim-ts-autotag"),

	-- sql
	load_plugin_config("nanotee/sqls.nvim", "plugin/sqls"),

	-- code auto complete
	-- engine
	load_plugin_config("hrsh7th/nvim-cmp", "plugin/nvim-cmp"),
	-- better ui
	load_plugin_config("onsails/lspkind-nvim", "plugin/lspkind-nvim"),
	-- tools
	"lukas-reineke/cmp-under-comparator",
	-- source
	-- more sources on https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"rcarriga/cmp-dap",
	"hrsh7th/cmp-cmdline",
	"dmitmel/cmp-cmdline-history",
	"lukas-reineke/cmp-rg",
	-- snippets
	load_plugin_config("L3MON4D3/LuaSnip", "plugin/luasnip"),
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- status line
	load_plugin_config("nvim-lualine/lualine.nvim", "plugin/lualine"),
	-- undotree
	load_plugin_config("jiaoshijie/undotree", "plugin/undotree"),
	-- a pretty diagnostics, references, telescope results, quickfix and location list
	load_plugin_config("folke/trouble.nvim", "plugin/trouble"),
	-- quickly modify surround char
	load_plugin_config("kylechui/nvim-surround", "plugin/nvim-surround"),
	-- call sudo in neovim
	load_plugin_config("lambdalisue/suda.vim", "plugin/suda"),
	-- highlights cursor words and lines
	load_plugin_config("yamatsum/nvim-cursorline", "plugin/nvim-cursorline"),

	-- debug
	load_plugin_config("mfussenegger/nvim-dap", "plugin/nvim-dap"),
	"niuiic/nvim-dap-vscode-js",
	"nvim-telescope/telescope-dap.nvim",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",
	"ofirgall/goto-breakpoints.nvim",
	"jbyuki/one-small-step-for-vimkind",

	-- unit test
	load_plugin_config("nvim-neotest/neotest", "plugin/neotest"),
	load_plugin_config("andythigpen/nvim-coverage", "plugin/nvim-coverage"),

	-- colorscheme
	load_plugin_config("folke/tokyonight.nvim", "plugin/tokyonight"),
	-- git signs
	load_plugin_config("lewis6991/gitsigns.nvim", "plugin/gitsigns"),
	-- resolve git conflict
	load_plugin_config("akinsho/git-conflict.nvim", "plugin/git-conflict"),
	-- color picker & colorizer
	load_plugin_config("uga-rosa/ccc.nvim", "plugin/ccc"),
	-- indentation guides
	load_plugin_config("echasnovski/mini.indentscope", "plugin/mini-indentscope"),
	-- tab line
	load_plugin_config("akinsho/bufferline.nvim", "plugin/bufferline"),
	-- git diff gui
	load_plugin_config("sindrets/diffview.nvim", "plugin/diffview"),
	-- just use as a formatter manager now
	load_plugin_config("jose-elias-alvarez/null-ls.nvim", "plugin/null-ls"),

	-- fuzzy search
	load_plugin_config("nvim-telescope/telescope.nvim", "plugin/telescope"),
	-- extensions
	-- yank
	load_plugin_config("gbprod/yanky.nvim", "plugin/yanky"),
	-- todo comments
	load_plugin_config("folke/todo-comments.nvim", "plugin/todo-comments"),
	-- media preview
	load_plugin_config("nvim-telescope/telescope-media-files.nvim", "plugin/telescope-media-files"),
	-- recent files
	load_plugin_config("smartpde/telescope-recent-files", "plugin/telescope-recent-files"),

	-- task manager
	load_plugin_config("stevearc/overseer.nvim", "plugin/overseer"),

	-- lsp
	"neovim/nvim-lspconfig",
	load_plugin_config("glepnir/lspsaga.nvim", "plugin/lspsaga"),
	load_plugin_config("niuiic/lsp-utils.nvim", "plugin/lsp-utils"),

	-- lsp, dap, linter, formatter installer
	load_plugin_config("williamboman/mason.nvim", "plugin/mason"),
	-- search and replace in project
	load_plugin_config("windwp/nvim-spectre", "plugin/nvim-spectre"),
	-- buffer / mark / tabpage / colorscheme switcher
	load_plugin_config("toppair/reach.nvim", "plugin/reach"),
	-- annotation generator
	load_plugin_config("danymat/neogen", "plugin/neogen"),
	-- highlight current n
	load_plugin_config("rktjmp/highlight-current-n.nvim", "plugin/highlight-current-n"),
	-- pretty ui
	load_plugin_config("folke/noice.nvim", "plugin/noice"),
	load_plugin_config("stevearc/dressing.nvim", "plugin/dressing"),
	-- macro
	load_plugin_config("ecthelionvi/NeoComposer.nvim", "plugin/neo-composer"),
	-- crate
	load_plugin_config("saecki/crates.nvim", "plugin/crates"),
	-- js/ts package info
	load_plugin_config("vuki656/package-info.nvim", "plugin/package-info"),
	-- divider line
	load_plugin_config("niuiic/divider.nvim", "plugin/divider"),
	-- clipboard image
	load_plugin_config("niuiic/cp-image.nvim", "plugin/cp-image"),
	-- translate
	load_plugin_config("niuiic/translate.nvim", "plugin/translate"),
	-- session
	load_plugin_config("niuiic/multiple-session.nvim", "plugin/multiple-session"),
	-- window picker
	load_plugin_config("s1n7ax/nvim-window-picker", "plugin/nvim-window-picker"),
	-- maximize window
	load_plugin_config("niuiic/window.nvim", "plugin/window"),
	-- edit part of the file
	load_plugin_config("niuiic/part-edit.nvim", "plugin/part-edit"),
	-- move block
	load_plugin_config("echasnovski/mini.move", "plugin/mini-move"),
	-- custom navigation
	load_plugin_config("LeonHeidelbach/trailblazer.nvim", "plugin/trailblazer"),
	-- filetype manager
	load_plugin_config("niuiic/filetype.nvim", "plugin/filetype"),
	-- quickfix
	load_plugin_config("niuiic/quickfix.nvim", "plugin/quickfix"),
	-- github action
	load_plugin_config("topaxi/gh-actions.nvim", "plugin/gh-actions"),
	-- uses lua patterns instead of vim regex
	load_plugin_config("chrisgrieser/nvim-alt-substitute", "plugin/nvim-alt-substitute"),
	-- hover
	load_plugin_config("lewis6991/hover.nvim", "plugin/hover"),
	-- split/join functions
	load_plugin_config("Wansmer/treesj", "plugin/treesj"),
	-- smooth scrolling
	load_plugin_config("karb94/neoscroll.nvim", "plugin/neoscroll"),
	-- remove buffer
	load_plugin_config("echasnovski/mini.bufremove", "plugin/mini-bufremove"),
})
