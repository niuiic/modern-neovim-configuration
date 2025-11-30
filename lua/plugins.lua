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
if not vim.uv.fs_stat(lazypath) then
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
	-- core
	"niuiic/core.nvim",
	-- omega
	load_plugin_config("niuiic/omega.nvim", "plugin/omega"),
	-- shortcut suggestions
	load_plugin_config("folke/which-key.nvim", "plugin/which-key"),
	-- auto complete pairs
	load_plugin_config("windwp/nvim-autopairs", "plugin/nvim-autopairs"),
	-- fold
	load_plugin_config("kevinhwang91/nvim-ufo", "plugin/nvim-ufo"),
	-- lazygit
	load_plugin_config("kdheepak/lazygit.nvim", "plugin/lazygit"),
	-- quick motion
	load_plugin_config("folke/flash.nvim", "plugin/flash"),
	-- file tree
	load_plugin_config("kyazdani42/nvim-tree.lua", "plugin/nvim-tree"),
	-- parsers
	load_plugin_config("nvim-treesitter/nvim-treesitter", "plugin/nvim-treesitter"),
	-- rainbow brackets
	load_plugin_config("HiPhish/rainbow-delimiters.nvim", "plugin/rainbow-delimiters"),
	-- highlight args
	load_plugin_config("m-demare/hlargs.nvim", "plugin/hlargs"),
	-- better matchup
	load_plugin_config("andymass/vim-matchup", "plugin/vim-matchup"),
	-- auto complete tag in html
	load_plugin_config("windwp/nvim-ts-autotag", "plugin/nvim-ts-autotag"),
	-- complete
	load_plugin_config("Saghen/blink.cmp", "plugin/blink-cmp"),
	-- a pretty diagnostics, references, telescope results, quickfix and location list
	load_plugin_config("folke/trouble.nvim", "plugin/trouble"),
	-- quickly modify surround char
	load_plugin_config("kylechui/nvim-surround", "plugin/nvim-surround"),
	-- highlights cursor word
	load_plugin_config("nvim-mini/mini.cursorword", "plugin/cursorword"),
	-- debug
	load_plugin_config("mfussenegger/nvim-dap", "plugin/nvim-dap"),
	-- unit test
	load_plugin_config("nvim-neotest/neotest", "plugin/neotest"),
	load_plugin_config("andythigpen/nvim-coverage", "plugin/nvim-coverage"),
	-- colorscheme
	load_plugin_config("folke/tokyonight.nvim", "plugin/tokyonight"),
	-- git signs
	load_plugin_config("lewis6991/gitsigns.nvim", "plugin/gitsigns"),
	-- colorizer
	load_plugin_config("brenoprata10/nvim-highlight-colors", "plugin/nvim-highlight-colors"),
	-- indentation guides
	load_plugin_config("nvim-mini/mini.indentscope", "plugin/mini-indentscope"),
	-- fuzzy search
	load_plugin_config("nvim-telescope/telescope.nvim", "plugin/telescope"),
	-- lsp
	"neovim/nvim-lspconfig",
	load_plugin_config("niuiic/lsp-commands.nvim", "plugin/lsp-commands"),
	load_plugin_config("rachartier/tiny-code-action.nvim", "plugin/tiny-code-action"),
	-- lsp, dap, linter, formatter installer
	load_plugin_config("mason-org/mason.nvim", "plugin/mason"),
	-- annotation generator
	load_plugin_config("danymat/neogen", "plugin/neogen"),
	-- highlight current n
	load_plugin_config("rktjmp/highlight-current-n.nvim", "plugin/highlight-current-n"),
	-- pretty ui
	load_plugin_config("folke/noice.nvim", "plugin/noice"),
	load_plugin_config("stevearc/dressing.nvim", "plugin/dressing"),
	-- divider line
	load_plugin_config("niuiic/divider.nvim", "plugin/divider"),
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
	load_plugin_config("nvim-mini/mini.move", "plugin/mini-move"),
	-- quickfix
	load_plugin_config("niuiic/quickfix.nvim", "plugin/quickfix"),
	-- split/join functions
	load_plugin_config("Wansmer/treesj", "plugin/treesj"),
	-- format
	load_plugin_config("niuiic/format.nvim", "plugin/format"),
	-- open url
	load_plugin_config("sontungexpt/url-open", "plugin/url-open"),
	-- git log
	load_plugin_config("niuiic/git-log.nvim", "plugin/git-log"),
	-- remote edit
	load_plugin_config("niuiic/remote.nvim", "plugin/remote"),
	-- terminal
	load_plugin_config("niuiic/terminal.nvim", "plugin/terminal"),
	-- columns limit
	load_plugin_config("ecthelionvi/NeoColumn.nvim", "plugin/neo-column"),
	-- ai
	load_plugin_config("monkoose/neocodeium", "plugin/neocodeium"),
	-- ts error
	load_plugin_config("dmmulroy/ts-error-translator.nvim", "plugin/ts-error-translator"),
	-- jump outer
	load_plugin_config("Mr-LLLLL/treesitter-outer", "plugin/treesitter-outer"),
	-- track
	load_plugin_config("niuiic/track.nvim", "plugin/track"),
	-- outline
	load_plugin_config("hedyhli/outline.nvim", "plugin/outline"),
	-- task
	load_plugin_config("niuiic/task.nvim", "plugin/task"),
	-- vtsls
	"yioneko/nvim-vtsls",
	-- lua lsp
	load_plugin_config("folke/lazydev.nvim", "plugin/lazydev"),
	-- replace in buffer
	load_plugin_config("chrisgrieser/nvim-rip-substitute", "plugin/nvim-rip-substitute"),
	-- replace in project
	load_plugin_config("MagicDuck/grug-far.nvim", "plugin/grug-far"),
	-- structural replace
	load_plugin_config("cshuaimin/ssr.nvim", "plugin/ssr"),
	-- todo comments
	load_plugin_config("folke/todo-comments.nvim", "plugin/todo-comments"),
	-- shot code
	load_plugin_config("niuiic/code-shot.nvim", "plugin/code-shot"),
	-- animate cursor
	load_plugin_config("sphamba/smear-cursor.nvim", "plugin/smear-cursor"),
	-- manage deps
	load_plugin_config("niuiic/deps.nvim", "plugin/deps"),
	-- buffer manager
	load_plugin_config("niuiic/buffers.nvim", "plugin/buffers"),
	-- automatically switch input method when input mode changed
	load_plugin_config("niuiic/im-switch.nvim", "plugin/im-switch"),
	-- plantuml
	"aklt/plantuml-syntax",
	-- embed lsp
	load_plugin_config("jmbuhr/otter.nvim", "plugin/otter"),
	-- text case
	"gregorias/coerce.nvim",
})
