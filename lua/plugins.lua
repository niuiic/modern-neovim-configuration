-- find more awesome plugins
-- https://github.com/rockerBOO/awesome-neovim
-- http://neovimcraft.com
-- https://github.com/ayamir/nvimdots/wiki/Plugins

local load_plugin_config = function(plugin, config_path, dir)
	local ok, config = pcall(require, config_path)
	if not ok or config == nil then
		vim.notify("Error: failed to load config " .. config_path, vim.log.levels.ERROR)
		return {}
	end

	if dir then
		config.dir = dir
	else
		config[1] = plugin
	end

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
	--core
	"niuiic/core.nvim",
	-- shortcut suggestions
	load_plugin_config("folke/which-key.nvim", "plugin/which-key"),
	-- dev doc
	load_plugin_config("folke/neodev.nvim", "plugin/neodev"),
	-- auto complete pairs
	load_plugin_config("windwp/nvim-autopairs", "plugin/nvim-autopairs"),
	-- automatically switch input method when input mode changed
	load_plugin_config("niuiic/fcitx.nvim", "plugin/fcitx"),
	-- displays neovim startup time
	load_plugin_config("dstein64/vim-startuptime", "plugin/vim-startuptime"),
	-- fold
	load_plugin_config("kevinhwang91/nvim-ufo", "plugin/nvim-ufo"),
	-- lazygit
	load_plugin_config("kdheepak/lazygit.nvim", "plugin/lazygit"),
	-- toggle comments
	load_plugin_config("numToStr/Comment.nvim", "plugin/comment"),
	-- automatically toggle between absolute line number and relative one
	"sitiom/nvim-numbertoggle",
	-- quick motion
	load_plugin_config("folke/flash.nvim", "plugin/flash"),
	-- file tree
	load_plugin_config("kyazdani42/nvim-tree.lua", "plugin/nvim-tree"),

	-- better syntax highlight
	load_plugin_config("nvim-treesitter/nvim-treesitter", "plugin/nvim-treesitter"),
	-- extensions
	-- rainbow brackets
	load_plugin_config("HiPhish/rainbow-delimiters.nvim", "plugin/rainbow-delimiters"),
	-- highlight args
	load_plugin_config("m-demare/hlargs.nvim", "plugin/hlargs"),
	-- better matchup
	"andymass/vim-matchup",
	-- syntax aware text-objects, select, move, swap, and peek support
	"nvim-treesitter/nvim-treesitter-textobjects",
	-- auto complete tag in html
	load_plugin_config("windwp/nvim-ts-autotag", "plugin/nvim-ts-autotag"),

	-- code auto complete
	-- engine
	load_plugin_config("hrsh7th/nvim-cmp", "plugin/nvim-cmp"),
	-- better ui
	"onsails/lspkind-nvim",
	-- source
	-- more sources on https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"FelipeLema/cmp-async-path",
	"rcarriga/cmp-dap",
	"LiadOz/nvim-dap-repl-highlights",
	"hrsh7th/cmp-cmdline",
	"dmitmel/cmp-cmdline-history",
	"lukas-reineke/cmp-rg",
	"ray-x/cmp-treesitter",
	-- snippets
	load_plugin_config("L3MON4D3/LuaSnip", "plugin/luasnip"),
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	-- comparators
	"zjp-CN/nvim-cmp-lsp-rs",

	-- status line
	load_plugin_config("nvim-lualine/lualine.nvim", "plugin/lualine"),
	-- a pretty diagnostics, references, telescope results, quickfix and location list
	load_plugin_config("folke/trouble.nvim", "plugin/trouble"),
	-- quickly modify surround char
	load_plugin_config("kylechui/nvim-surround", "plugin/nvim-surround"),
	-- highlights cursor word
	load_plugin_config("tzachar/local-highlight.nvim", "plugin/local-highlight"),

	-- debug
	load_plugin_config("mfussenegger/nvim-dap", "plugin/nvim-dap"),
	"niuiic/dap-utils.nvim",
	"mxsdev/nvim-dap-vscode-js",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",
	"ofirgall/goto-breakpoints.nvim",
	"jbyuki/one-small-step-for-vimkind",
	"nvim-neotest/nvim-nio",
	load_plugin_config("andrewferrier/debugprint.nvim", "plugin/debugprint"),

	-- unit test
	load_plugin_config("nvim-neotest/neotest", "plugin/neotest"),
	load_plugin_config("andythigpen/nvim-coverage", "plugin/nvim-coverage"),

	-- colorscheme
	load_plugin_config("folke/tokyonight.nvim", "plugin/tokyonight"),
	-- git signs
	load_plugin_config("lewis6991/gitsigns.nvim", "plugin/gitsigns"),
	-- color picker & colorizer
	load_plugin_config("uga-rosa/ccc.nvim", "plugin/ccc"),
	-- indentation guides
	load_plugin_config("echasnovski/mini.indentscope", "plugin/mini-indentscope"),
	-- tab line
	load_plugin_config("akinsho/bufferline.nvim", "plugin/bufferline"),
	-- git diff gui
	load_plugin_config("sindrets/diffview.nvim", "plugin/diffview"),

	-- fuzzy search
	load_plugin_config("nvim-telescope/telescope.nvim", "plugin/telescope"),
	-- todo comments
	load_plugin_config("folke/todo-comments.nvim", "plugin/todo-comments"),
	-- recent files
	load_plugin_config("smartpde/telescope-recent-files", "plugin/telescope-recent-files"),
	-- undo
	"debugloop/telescope-undo.nvim",
	-- project
	load_plugin_config("cljoly/telescope-repo.nvim", "plugin/telescope-repo"),

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
	-- annotation generator
	load_plugin_config("danymat/neogen", "plugin/neogen"),
	-- highlight current n
	load_plugin_config("rktjmp/highlight-current-n.nvim", "plugin/highlight-current-n"),
	-- pretty ui
	load_plugin_config("folke/noice.nvim", "plugin/noice"),
	load_plugin_config("stevearc/dressing.nvim", "plugin/dressing"),
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
	-- quickfix
	load_plugin_config("niuiic/quickfix.nvim", "plugin/quickfix"),
	-- split/join functions
	load_plugin_config("Wansmer/treesj", "plugin/treesj"),
	-- smooth scrolling
	load_plugin_config("niuiic/scroll.nvim", "plugin/scroll"),
	-- remove buffer
	load_plugin_config("echasnovski/mini.bufremove", "plugin/mini-bufremove"),
	-- format
	load_plugin_config("niuiic/format.nvim", "plugin/format"),
	-- code shot
	load_plugin_config("niuiic/code-shot.nvim", "plugin/code-shot"),
	-- open url
	load_plugin_config("sontungexpt/url-open", "plugin/url-open"),
	-- preview typst documents
	load_plugin_config("chomosuke/typst-preview.nvim", "plugin/typst-preview"),
	-- git log
	load_plugin_config("niuiic/git-log.nvim", "plugin/git-log"),
	-- remote edit
	load_plugin_config("niuiic/remote.nvim", "plugin/remote"),
	-- terminal
	load_plugin_config("niuiic/terminal.nvim", "plugin/terminal"),
	-- columns limit
	load_plugin_config("ecthelionvi/NeoColumn.nvim", "plugin/neo-column"),
	-- ai
	load_plugin_config("Exafunction/codeium.nvim", "plugin/codeium"),
	-- ts error
	load_plugin_config("dmmulroy/ts-error-translator.nvim", "plugin/ts-error-translator"),
	-- jump outer
	load_plugin_config("Mr-LLLLL/treesitter-outer", "plugin/treesitter-outer"),
	-- typescript tools
	load_plugin_config("pmizio/typescript-tools.nvim", "plugin/typescript-tools"),
	-- track
	load_plugin_config("niuiic/track.nvim", "plugin/track", "~/Documents/projects/track.nvim"),
})
