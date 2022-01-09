-- cSpell:disable
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
    function()
        use 'wbthomason/packer.nvim'
        use 'vim-airline/vim-airline'
        use 'vim-airline/vim-airline-themes'
        use 'enricobacis/vim-airline-clock'
        use 'liuchengxu/vim-which-key'
        use 'voldikss/vim-floaterm'
        use 'tpope/vim-surround'
        use {'neoclide/coc.nvim', branch = 'release'}
        use 'euclio/vim-markdown-composer'
        use 'simnalamburt/vim-mundo'
        use 'lambdalisue/suda.vim'
        use 'hardcoreplayers/dashboard-nvim'
        use 'ryanoasis/vim-devicons'
        use 'voldikss/vim-codelf'
        use 'RRethy/vim-illuminate'
        use 'kshenoy/vim-signature'
        use 'tpope/vim-repeat'
        use 'sheerun/vim-polyglot'
        use 'terryma/vim-smooth-scroll'
        use 'liuchengxu/vista.vim'
        use 'vhda/verilog_systemverilog.vim'
        use 'easymotion/vim-easymotion'
        use 'Yggdroot/indentLine'
        use 'honza/vim-snippets'
        -- use 'lilydjwg/fcitx.vim'
        use 'xolox/vim-misc'
        use {'cespare/vim-toml', ft = 'toml'}
        use {'liuchengxu/vim-clap', run = ':Clap install-binary'}
        use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'}
        use 'preservim/nerdcommenter'
        use 'rbtnn/vim-vimscript_indentexpr'
        use 'tpope/vim-fugitive'
        use 'airblade/vim-gitgutter'
        use 'skywind3000/asynctasks.vim'
        use 'skywind3000/asyncrun.vim'
        use 'liuchengxu/space-vim-dark'
        use 'dhruvasagar/vim-zoom'
        use 'sbdchd/neoformat'
        use 'leafOfTree/vim-vue-plugin'
        use 'arzg/vim-swift'
        use 'andymass/vim-matchup'
        use 'nvim-treesitter/nvim-treesitter'
        use 'jeffkreeftmeijer/vim-numbertoggle'
        use 'bagrat/vim-buffet'
        use 'luochen1990/rainbow'
        use 'puremourning/vimspector'
        use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'}
    end,
    config = {
        ensure_dependencies = true,
        plugin_package = 'packer',
        max_jobs = nil,
        auto_clean = true,
        compile_on_sync = true,
        disable_commands = false,
        opt_default = false,
        transitive_opt = true,
        transitive_disable = true,
        auto_reload_compiled = true,
        git = {
            cmd = 'git',
            subcommands = {
                update = 'pull --ff-only --progress --rebase=false',
                install = 'clone --depth %i --no-single-branch --progress',
                fetch = 'fetch --depth 999999 --progress',
                checkout = 'checkout %s --',
                update_branch = 'merge --ff-only @{u}',
                current_branch = 'branch --show-current',
                diff = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
                diff_fmt = '%%h %%s (%%cr)',
                get_rev = 'rev-parse --short HEAD',
                get_msg = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
                submodules = 'submodule update --init --recursive --progress'
            },
            depth = 1,
            clone_timeout = 60,
            default_url_format = 'https://github.com/%s'
        },
        display = {
            non_interactive = false,
            open_fn = nil,
            open_cmd = '65vnew \\[packer\\]',
            working_sym = '⟳',
            error_sym = '✗',
            done_sym = '✓',
            removed_sym = '-',
            moved_sym = '→',
            header_sym = '━',
            show_all_info = true,
            prompt_border = 'double',
            keybindings = {
                quit = 'q',
                toggle_info = '<CR>',
                diff = 'd',
                prompt_revert = 'r'
            }
        },
        luarocks = {python_cmd = 'python'},
        log = {level = 'warn'},
        profile = {enable = false, threshold = 1}
    }
})

