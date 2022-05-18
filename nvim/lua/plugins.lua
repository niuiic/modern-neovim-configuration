local status, packer = pcall(require, "packer")
if not status then
	vim.notify("not found packer")
	return
end

packer.startup({
	function(use)
		-- plugin manager
		use("wbthomason/packer.nvim")
		-- todo comments (not work correctly)
		use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
		-- status line
		use({
			"nvim-lualine/lualine.nvim",
			requires = {
				"kyazdani42/nvim-web-devicons",
				-- to provide vista_nearest_method_or_function
				"liuchengxu/vista.vim",
				opt = true,
			},
		})
		use("voldikss/vim-floaterm")
		use({ "neoclide/coc.nvim", branch = "release" })
		use("simnalamburt/vim-mundo")
		-- use 'tpope/vim-surround'
		-- call sudo in neovim (fully configured)
		use("lambdalisue/suda.vim")
		-- project manager
		use({ "ahmedkhalf/project.nvim", requires = "nvim-telescope/telescope.nvim" })
		-- dashboard
		use("glepnir/dashboard-nvim")
		use("ryanoasis/vim-devicons")
		use("voldikss/vim-codelf")
		use("RRethy/vim-illuminate")
		use("kshenoy/vim-signature")
		use("tpope/vim-repeat")
		use("sheerun/vim-polyglot")
		use("terryma/vim-smooth-scroll")
		use("liuchengxu/vista.vim")
		-- support for systemverilog (fully configured)
		use({ "vhda/verilog_systemverilog.vim", ft = "systemverilog" })
		use("easymotion/vim-easymotion")
		use("Yggdroot/indentLine")
		use("folke/which-key.nvim")
		use("honza/vim-snippets")
		-- automatically switch input method when input mode changed (fully configured)
		use("lilydjwg/fcitx.vim")
		use("xolox/vim-misc")
		use({ "cespare/vim-toml", ft = "toml" })
		-- use({ "liuchengxu/vim-clap", run = ":Clap install-binary" })
		use({ "Yggdroot/LeaderF", run = ":LeaderfInstallCExtension" })
		use("preservim/nerdcommenter")
		use("rbtnn/vim-vimscript_indentexpr")
		use({
			"rcarriga/vim-ultest",
			requires = { "vim-test/vim-test" },
			run = ":UpdateRemotePlugins",
		})
		use("tpope/vim-fugitive")
		use("airblade/vim-gitgutter")
		use({ "skywind3000/asynctasks.vim", requires = "skywind3000/asyncrun.vim" })
		use("folke/tokyonight.nvim")
		use("dhruvasagar/vim-zoom")
		use("sbdchd/neoformat")
		use("leafOfTree/vim-vue-plugin")
		use({ "arzg/vim-swift", ft = "swift" })
		use({ "andymass/vim-matchup" })
		-- better syntax highlight
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		-- automatically toggle between absolute line number and relative one
		use("jeffkreeftmeijer/vim-numbertoggle")
		-- tab line (something wrong with custom filters)
		use({
			"akinsho/bufferline.nvim",
			tag = "v2.*",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use("luochen1990/rainbow")
		-- debugger
		use("puremourning/vimspector")
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
		use("gko/vim-coloresque")
		use("voldikss/vim-translator")
		-- just use as a formatter manager now (continue to configure)
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = "nvim-lua/plenary.nvim",
		})
		-- fuzzy search (cannot search hidden files, quickfix)
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})
		-- use 'styled-components/vim-styled-components'
	end,
	config = {
		ensure_dependencies = true,
		plugin_package = "packer",
		max_jobs = nil,
		auto_clean = true,
		compile_on_sync = true,
		disable_commands = false,
		opt_default = false,
		transitive_opt = true,
		transitive_disable = true,
		auto_reload_compiled = true,
		git = {
			cmd = "git",
			subcommands = {
				update = "pull --ff-only --progress --rebase=false",
				install = "clone --depth %i --no-single-branch --progress",
				fetch = "fetch --depth 999999 --progress",
				checkout = "checkout %s --",
				update_branch = "merge --ff-only @{u}",
				current_branch = "branch --show-current",
				diff = "log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD",
				diff_fmt = "%%h %%s (%%cr)",
				get_rev = "rev-parse --short HEAD",
				get_msg = "log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1",
				submodules = "submodule update --init --recursive --progress",
			},
			depth = 1,
			clone_timeout = 60,
			default_url_format = "https://github.com/%s",
		},
		display = {
			non_interactive = false,
			open_fn = nil,
			open_cmd = "65vnew \\[packer\\]",
			working_sym = "⟳",
			error_sym = "✗",
			done_sym = "✓",
			removed_sym = "-",
			moved_sym = "→",
			header_sym = "━",
			show_all_info = true,
			prompt_border = "double",
			keybindings = {
				quit = "q",
				toggle_info = "<CR>",
				diff = "d",
				prompt_revert = "r",
			},
		},
		luarocks = { python_cmd = "python" },
		log = { level = "warn" },
		profile = { enable = false, threshold = 1 },
	},
})
