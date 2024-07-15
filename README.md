# Modern Neovim Configuration

Neovim + Linux = Best Almighty IDE

> This configuration is for linux only.

## Mainly Supported Language/Framework List

- Rust
- Javascript/Typescript
- Python
- Shell
- SQL
- Lua
- GLSL
- WGSL
- Vue
- React

To support a new one, check these.

- treesitter
- lsp
- dap (nvim-dap, neotest)
- formatter
- snippet

## Personal Environment

OS: Gentoo

Terminal: Alacritty

Neovim: V0.10+

## Dependencies

1. `nodejs`, `rust` (required for `mason.nvim` and `nvim-treesitter`). Use `:h mason-requirements` to check more dependencies.
2. `rg`, `fd` command (required for `telescope.nvim`)
3. `trashy` command (required for `nvim-tree.lua`)
4. `fcitx5` (required for `fcitx.nvim`)
5. `deeplx` (required for `translate.nvim`)
6. `cargo-nextest` (required for `neotest-rust.nvim`)
7. `@vue/typescript-plugin` (required for vue project)
8. `dolphin` (required for `nvim-tree.lua`)

## QuickStart

### Installation

1. Install all dependencies.

2. `git clone https://github.com/niuiic/modern-neovim-configuration ~/.config/nvim`

3. Open neovim and then all plugins would be installed automatically.

4. Install lsps, formatters, linters, debuggers with `mason.nvim`. Check `lua/plugin/mason.lua` for details.

5. Check if something is missing with `:checkhealth`.

6. Look for specific functions in `lua/plugins.lua`.

### Keymap

`which-key.nvim` will tell you. Check `lua/plugin/*` and `lua/keymap.lua` for details.

> leader: `\`

> localLeader: `<space>`

### LSP

Create `lspname.lua` in `lua/lsp`.

Update `lsp_list` in `lua/lsp/init.lua`.

Remap lsp commands with `lsp-utils.nvim` in `lua/plugin/lsp-utils.lua`.

### Formatter

Use your favorite formatters with [niuiic/format.nvim](https://github.com/niuiic/format.nvim).

### DAP

Create `dapname.lua` in `lua/debugger`.

Update `debugger_list` in `lua/debugger/init.lua`.

### Custom Snippets

Create `filetype.lua` in `lua/snippet`.

Update `lang_list` in `lua/snippet/init.lua`.

> [Snippet examples](https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua) and [snippet document](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md) may help you.

### Config for Workspace

The root path of a workspace is where `.git` located. `$rootPath/.nvim/init.lua` is the entry of the local configuration.

## Showcase

Some functions are not convenient to display with pictures, please check `lua/plugins.lua`.

<details>
  <summary><b>Status Line</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/statusline.png"/>
</details>

<details>
  <summary><b>Buffer Line</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/bufferline.png"/>
</details>

<details>
  <summary><b><b>Diagnostic</b></b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/diagnostic.png"/>
</details>

<details>
  <summary><b>Fuzzy Finder</b></summary>
Search files, tags, buffers, history files, marks, projects, git status, etc.
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/fuzzy-finder.png"/>
</details>

<details>
  <summary><b>AutoComplete CMD</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/autocomplete-cmd.png"/>
</details>

<details>
  <summary><b>Rename</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/rename.png"/>
</details>

<details>
  <summary><b>Go to Reference</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/goto-reference.png"/>
</details>

<details>
  <summary><b>Keymap Suggestion</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/keymap-suggestion.png"/>
</details>

<details>
  <summary><b>Code AutoComplete</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/code-autocomplete.png"/>
</details>

<details>
  <summary><b>Inner Terminal</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/inner-terminal.png"/>
</details>

<details>
  <summary><b>Todo Comments</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/todo-comments.png"/>
</details>

<details>
  <summary><b>File Tree</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/file-tree.png"/>
</details>

<details>
  <summary><b>Undo Tree</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/undo-tree.png"/>
</details>

<details>
  <summary><b>Translate</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/translate.png"/>
</details>

<details>
  <summary><b>Unit Test</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/unit-test.png"/>
</details>

<details>
  <summary><b>Tasks</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/tasks.png"/>
</details>

<details>
  <summary><b>Indentation Guides</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/indentation-guides.png"/>
</details>

<details>
  <summary><b>Code Action</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/code-action.png"/>
</details>

<details>
  <summary><b>Colorful Brackets</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/colorful-brackets.png"/>
</details>

<details>
  <summary><b>Debug</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/debug.png"/>
</details>

<details>
  <summary><b>Git Diff</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/git-diff.png"/>
</details>

<details>
  <summary><b>Git Signs</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/git-signs.png"/>
</details>

<details>
  <summary><b>Document</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/document.png"/>
</details>

<details>
  <summary><b>Quick Motion</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/quick-motion.png"/>
</details>

<details>
  <summary><b>Lsp Progress</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/lsp-progress.png"/>
</details>

<details>
  <summary><b>Fold</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/fold.png"/>
</details>

<details>
  <summary><b>Colorizer</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/colorizer.png"/>
</details>

<details>
  <summary><b>Color Picker</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/color-picker.png"/>
</details>

<details>
  <summary><b>Session</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/session.png"/>
</details>

<details>
  <summary><b>Quickfix</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/quickfix.png"/>
</details>

<details>
  <summary><b>Startup Time</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/startup-time.png"/>
</details>

<details>
  <summary><b>Lazygit</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/laygit.png"/>
</details>

<details>
  <summary><b>Jump to Marks</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/jump-to-marks.png"/>
</details>

<details>
  <summary><b>Pick Window</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/pick-window.png"/>
</details>

<details>
  <summary><b>Divider</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/divider.png"/>
</details>

## plugins

- [Bilal2453/luvit-meta](https://github.com/Bilal2453/luvit-meta) ![](https://img.shields.io/github/stars/Bilal2453/luvit-meta) ![](https://img.shields.io/github/last-commit/Bilal2453/luvit-meta) ![](https://img.shields.io/github/commit-activity/y/Bilal2453/luvit-meta)
- [FelipeLema/cmp-async-path](https://github.com/FelipeLema/cmp-async-path) ![](https://img.shields.io/github/stars/FelipeLema/cmp-async-path) ![](https://img.shields.io/github/last-commit/FelipeLema/cmp-async-path) ![](https://img.shields.io/github/commit-activity/y/FelipeLema/cmp-async-path)
- [HiPhish/rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) ![](https://img.shields.io/github/stars/HiPhish/rainbow-delimiters.nvim) ![](https://img.shields.io/github/last-commit/HiPhish/rainbow-delimiters.nvim) ![](https://img.shields.io/github/commit-activity/y/HiPhish/rainbow-delimiters.nvim)
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) ![](https://img.shields.io/github/stars/L3MON4D3/LuaSnip) ![](https://img.shields.io/github/last-commit/L3MON4D3/LuaSnip) ![](https://img.shields.io/github/commit-activity/y/L3MON4D3/LuaSnip)
- [LiadOz/nvim-dap-repl-highlights](https://github.com/LiadOz/nvim-dap-repl-highlights) ![](https://img.shields.io/github/stars/LiadOz/nvim-dap-repl-highlights) ![](https://img.shields.io/github/last-commit/LiadOz/nvim-dap-repl-highlights) ![](https://img.shields.io/github/commit-activity/y/LiadOz/nvim-dap-repl-highlights)
- [MagicDuck/grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) ![](https://img.shields.io/github/stars/MagicDuck/grug-far.nvim) ![](https://img.shields.io/github/last-commit/MagicDuck/grug-far.nvim) ![](https://img.shields.io/github/commit-activity/y/MagicDuck/grug-far.nvim)
- [Mr-LLLLL/treesitter-outer](https://github.com/Mr-LLLLL/treesitter-outer) ![](https://img.shields.io/github/stars/Mr-LLLLL/treesitter-outer) ![](https://img.shields.io/github/last-commit/Mr-LLLLL/treesitter-outer) ![](https://img.shields.io/github/commit-activity/y/Mr-LLLLL/treesitter-outer)
- [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) ![](https://img.shields.io/github/stars/MunifTanjim/nui.nvim) ![](https://img.shields.io/github/last-commit/MunifTanjim/nui.nvim) ![](https://img.shields.io/github/commit-activity/y/MunifTanjim/nui.nvim)
- [Wansmer/treesj](https://github.com/Wansmer/treesj) ![](https://img.shields.io/github/stars/Wansmer/treesj) ![](https://img.shields.io/github/last-commit/Wansmer/treesj) ![](https://img.shields.io/github/commit-activity/y/Wansmer/treesj)
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) ![](https://img.shields.io/github/stars/akinsho/bufferline.nvim) ![](https://img.shields.io/github/last-commit/akinsho/bufferline.nvim) ![](https://img.shields.io/github/commit-activity/y/akinsho/bufferline.nvim)
- [andymass/vim-matchup](https://github.com/andymass/vim-matchup) ![](https://img.shields.io/github/stars/andymass/vim-matchup) ![](https://img.shields.io/github/last-commit/andymass/vim-matchup) ![](https://img.shields.io/github/commit-activity/y/andymass/vim-matchup)
- [andythigpen/nvim-coverage](https://github.com/andythigpen/nvim-coverage) ![](https://img.shields.io/github/stars/andythigpen/nvim-coverage) ![](https://img.shields.io/github/last-commit/andythigpen/nvim-coverage) ![](https://img.shields.io/github/commit-activity/y/andythigpen/nvim-coverage)
- [antoinemadec/FixCursorHold.nvim](https://github.com/antoinemadec/FixCursorHold.nvim) ![](https://img.shields.io/github/stars/antoinemadec/FixCursorHold.nvim) ![](https://img.shields.io/github/last-commit/antoinemadec/FixCursorHold.nvim) ![](https://img.shields.io/github/commit-activity/y/antoinemadec/FixCursorHold.nvim)
- [brenoprata10/nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) ![](https://img.shields.io/github/stars/brenoprata10/nvim-highlight-colors) ![](https://img.shields.io/github/last-commit/brenoprata10/nvim-highlight-colors) ![](https://img.shields.io/github/commit-activity/y/brenoprata10/nvim-highlight-colors)
- [chomosuke/typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim) ![](https://img.shields.io/github/stars/chomosuke/typst-preview.nvim) ![](https://img.shields.io/github/last-commit/chomosuke/typst-preview.nvim) ![](https://img.shields.io/github/commit-activity/y/chomosuke/typst-preview.nvim)
- [chrisgrieser/nvim-rip-substitute](https://github.com/chrisgrieser/nvim-rip-substitute) ![](https://img.shields.io/github/stars/chrisgrieser/nvim-rip-substitute) ![](https://img.shields.io/github/last-commit/chrisgrieser/nvim-rip-substitute) ![](https://img.shields.io/github/commit-activity/y/chrisgrieser/nvim-rip-substitute)
- [cljoly/telescope-repo.nvim](https://github.com/cljoly/telescope-repo.nvim) ![](https://img.shields.io/github/stars/cljoly/telescope-repo.nvim) ![](https://img.shields.io/github/last-commit/cljoly/telescope-repo.nvim) ![](https://img.shields.io/github/commit-activity/y/cljoly/telescope-repo.nvim)
- [cshuaimin/ssr.nvim](https://github.com/cshuaimin/ssr.nvim) ![](https://img.shields.io/github/stars/cshuaimin/ssr.nvim) ![](https://img.shields.io/github/last-commit/cshuaimin/ssr.nvim) ![](https://img.shields.io/github/commit-activity/y/cshuaimin/ssr.nvim)
- [danymat/neogen](https://github.com/danymat/neogen) ![](https://img.shields.io/github/stars/danymat/neogen) ![](https://img.shields.io/github/last-commit/danymat/neogen) ![](https://img.shields.io/github/commit-activity/y/danymat/neogen)
- [debugloop/telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim) ![](https://img.shields.io/github/stars/debugloop/telescope-undo.nvim) ![](https://img.shields.io/github/last-commit/debugloop/telescope-undo.nvim) ![](https://img.shields.io/github/commit-activity/y/debugloop/telescope-undo.nvim)
- [dmitmel/cmp-cmdline-history](https://github.com/dmitmel/cmp-cmdline-history) ![](https://img.shields.io/github/stars/dmitmel/cmp-cmdline-history) ![](https://img.shields.io/github/last-commit/dmitmel/cmp-cmdline-history) ![](https://img.shields.io/github/commit-activity/y/dmitmel/cmp-cmdline-history)
- [dmmulroy/ts-error-translator.nvim](https://github.com/dmmulroy/ts-error-translator.nvim) ![](https://img.shields.io/github/stars/dmmulroy/ts-error-translator.nvim) ![](https://img.shields.io/github/last-commit/dmmulroy/ts-error-translator.nvim) ![](https://img.shields.io/github/commit-activity/y/dmmulroy/ts-error-translator.nvim)
- [dstein64/vim-startuptime](https://github.com/dstein64/vim-startuptime) ![](https://img.shields.io/github/stars/dstein64/vim-startuptime) ![](https://img.shields.io/github/last-commit/dstein64/vim-startuptime) ![](https://img.shields.io/github/commit-activity/y/dstein64/vim-startuptime)
- [echasnovski/mini.bufremove](https://github.com/echasnovski/mini.bufremove) ![](https://img.shields.io/github/stars/echasnovski/mini.bufremove) ![](https://img.shields.io/github/last-commit/echasnovski/mini.bufremove) ![](https://img.shields.io/github/commit-activity/y/echasnovski/mini.bufremove)
- [echasnovski/mini.comment](https://github.com/echasnovski/mini.comment) ![](https://img.shields.io/github/stars/echasnovski/mini.comment) ![](https://img.shields.io/github/last-commit/echasnovski/mini.comment) ![](https://img.shields.io/github/commit-activity/y/echasnovski/mini.comment)
- [echasnovski/mini.indentscope](https://github.com/echasnovski/mini.indentscope) ![](https://img.shields.io/github/stars/echasnovski/mini.indentscope) ![](https://img.shields.io/github/last-commit/echasnovski/mini.indentscope) ![](https://img.shields.io/github/commit-activity/y/echasnovski/mini.indentscope)
- [echasnovski/mini.move](https://github.com/echasnovski/mini.move) ![](https://img.shields.io/github/stars/echasnovski/mini.move) ![](https://img.shields.io/github/last-commit/echasnovski/mini.move) ![](https://img.shields.io/github/commit-activity/y/echasnovski/mini.move)
- [ecthelionvi/NeoColumn.nvim](https://github.com/ecthelionvi/NeoColumn.nvim) ![](https://img.shields.io/github/stars/ecthelionvi/NeoColumn.nvim) ![](https://img.shields.io/github/last-commit/ecthelionvi/NeoColumn.nvim) ![](https://img.shields.io/github/commit-activity/y/ecthelionvi/NeoColumn.nvim)
- [folke/flash.nvim](https://github.com/folke/flash.nvim) ![](https://img.shields.io/github/stars/folke/flash.nvim) ![](https://img.shields.io/github/last-commit/folke/flash.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/flash.nvim)
- [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim) ![](https://img.shields.io/github/stars/folke/lazydev.nvim) ![](https://img.shields.io/github/last-commit/folke/lazydev.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/lazydev.nvim)
- [folke/lsp-colors.nvim](https://github.com/folke/lsp-colors.nvim) ![](https://img.shields.io/github/stars/folke/lsp-colors.nvim) ![](https://img.shields.io/github/last-commit/folke/lsp-colors.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/lsp-colors.nvim)
- [folke/noice.nvim](https://github.com/folke/noice.nvim) ![](https://img.shields.io/github/stars/folke/noice.nvim) ![](https://img.shields.io/github/last-commit/folke/noice.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/noice.nvim)
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) ![](https://img.shields.io/github/stars/folke/tokyonight.nvim) ![](https://img.shields.io/github/last-commit/folke/tokyonight.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/tokyonight.nvim)
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim) ![](https://img.shields.io/github/stars/folke/trouble.nvim) ![](https://img.shields.io/github/last-commit/folke/trouble.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/trouble.nvim)
- [folke/ts-comments.nvim](https://github.com/folke/ts-comments.nvim) ![](https://img.shields.io/github/stars/folke/ts-comments.nvim) ![](https://img.shields.io/github/last-commit/folke/ts-comments.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/ts-comments.nvim)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim) ![](https://img.shields.io/github/stars/folke/which-key.nvim) ![](https://img.shields.io/github/last-commit/folke/which-key.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/which-key.nvim)
- [gbprod/yanky.nvim](https://github.com/gbprod/yanky.nvim) ![](https://img.shields.io/github/stars/gbprod/yanky.nvim) ![](https://img.shields.io/github/last-commit/gbprod/yanky.nvim) ![](https://img.shields.io/github/commit-activity/y/gbprod/yanky.nvim)
- [hedyhli/outline.nvim](https://github.com/hedyhli/outline.nvim) ![](https://img.shields.io/github/stars/hedyhli/outline.nvim) ![](https://img.shields.io/github/last-commit/hedyhli/outline.nvim) ![](https://img.shields.io/github/commit-activity/y/hedyhli/outline.nvim)
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) ![](https://img.shields.io/github/stars/hrsh7th/cmp-cmdline) ![](https://img.shields.io/github/last-commit/hrsh7th/cmp-cmdline) ![](https://img.shields.io/github/commit-activity/y/hrsh7th/cmp-cmdline)
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) ![](https://img.shields.io/github/stars/hrsh7th/cmp-nvim-lsp) ![](https://img.shields.io/github/last-commit/hrsh7th/cmp-nvim-lsp) ![](https://img.shields.io/github/commit-activity/y/hrsh7th/cmp-nvim-lsp)
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) ![](https://img.shields.io/github/stars/hrsh7th/nvim-cmp) ![](https://img.shields.io/github/last-commit/hrsh7th/nvim-cmp) ![](https://img.shields.io/github/commit-activity/y/hrsh7th/nvim-cmp)
- [jbyuki/one-small-step-for-vimkind](https://github.com/jbyuki/one-small-step-for-vimkind) ![](https://img.shields.io/github/stars/jbyuki/one-small-step-for-vimkind) ![](https://img.shields.io/github/last-commit/jbyuki/one-small-step-for-vimkind) ![](https://img.shields.io/github/commit-activity/y/jbyuki/one-small-step-for-vimkind)
- [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) ![](https://img.shields.io/github/stars/kdheepak/lazygit.nvim) ![](https://img.shields.io/github/last-commit/kdheepak/lazygit.nvim) ![](https://img.shields.io/github/commit-activity/y/kdheepak/lazygit.nvim)
- [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) ![](https://img.shields.io/github/stars/kevinhwang91/nvim-ufo) ![](https://img.shields.io/github/last-commit/kevinhwang91/nvim-ufo) ![](https://img.shields.io/github/commit-activity/y/kevinhwang91/nvim-ufo)
- [kevinhwang91/promise-async](https://github.com/kevinhwang91/promise-async) ![](https://img.shields.io/github/stars/kevinhwang91/promise-async) ![](https://img.shields.io/github/last-commit/kevinhwang91/promise-async) ![](https://img.shields.io/github/commit-activity/y/kevinhwang91/promise-async)
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) ![](https://img.shields.io/github/stars/kylechui/nvim-surround) ![](https://img.shields.io/github/last-commit/kylechui/nvim-surround) ![](https://img.shields.io/github/commit-activity/y/kylechui/nvim-surround)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) ![](https://img.shields.io/github/stars/lewis6991/gitsigns.nvim) ![](https://img.shields.io/github/last-commit/lewis6991/gitsigns.nvim) ![](https://img.shields.io/github/commit-activity/y/lewis6991/gitsigns.nvim)
- [lukas-reineke/cmp-rg](https://github.com/lukas-reineke/cmp-rg) ![](https://img.shields.io/github/stars/lukas-reineke/cmp-rg) ![](https://img.shields.io/github/last-commit/lukas-reineke/cmp-rg) ![](https://img.shields.io/github/commit-activity/y/lukas-reineke/cmp-rg)
- [luozhiya/fittencode.nvim](https://github.com/luozhiya/fittencode.nvim) ![](https://img.shields.io/github/stars/luozhiya/fittencode.nvim) ![](https://img.shields.io/github/last-commit/luozhiya/fittencode.nvim) ![](https://img.shields.io/github/commit-activity/y/luozhiya/fittencode.nvim)
- [m-demare/hlargs.nvim](https://github.com/m-demare/hlargs.nvim) ![](https://img.shields.io/github/stars/m-demare/hlargs.nvim) ![](https://img.shields.io/github/last-commit/m-demare/hlargs.nvim) ![](https://img.shields.io/github/commit-activity/y/m-demare/hlargs.nvim)
- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) ![](https://img.shields.io/github/stars/mfussenegger/nvim-dap) ![](https://img.shields.io/github/last-commit/mfussenegger/nvim-dap) ![](https://img.shields.io/github/commit-activity/y/mfussenegger/nvim-dap)
- [mxsdev/nvim-dap-vscode-js](https://github.com/mxsdev/nvim-dap-vscode-js) ![](https://img.shields.io/github/stars/mxsdev/nvim-dap-vscode-js) ![](https://img.shields.io/github/last-commit/mxsdev/nvim-dap-vscode-js) ![](https://img.shields.io/github/commit-activity/y/mxsdev/nvim-dap-vscode-js)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) ![](https://img.shields.io/github/stars/neovim/nvim-lspconfig) ![](https://img.shields.io/github/last-commit/neovim/nvim-lspconfig) ![](https://img.shields.io/github/commit-activity/y/neovim/nvim-lspconfig)
- [niuiic/code-shot.nvim](https://github.com/niuiic/code-shot.nvim) ![](https://img.shields.io/github/stars/niuiic/code-shot.nvim) ![](https://img.shields.io/github/last-commit/niuiic/code-shot.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/code-shot.nvim)
- [niuiic/core.nvim](https://github.com/niuiic/core.nvim) ![](https://img.shields.io/github/stars/niuiic/core.nvim) ![](https://img.shields.io/github/last-commit/niuiic/core.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/core.nvim)
- [niuiic/cp-image.nvim](https://github.com/niuiic/cp-image.nvim) ![](https://img.shields.io/github/stars/niuiic/cp-image.nvim) ![](https://img.shields.io/github/last-commit/niuiic/cp-image.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/cp-image.nvim)
- [niuiic/dap-utils.nvim](https://github.com/niuiic/dap-utils.nvim) ![](https://img.shields.io/github/stars/niuiic/dap-utils.nvim) ![](https://img.shields.io/github/last-commit/niuiic/dap-utils.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/dap-utils.nvim)
- [niuiic/divider.nvim](https://github.com/niuiic/divider.nvim) ![](https://img.shields.io/github/stars/niuiic/divider.nvim) ![](https://img.shields.io/github/last-commit/niuiic/divider.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/divider.nvim)
- [niuiic/fcitx.nvim](https://github.com/niuiic/fcitx.nvim) ![](https://img.shields.io/github/stars/niuiic/fcitx.nvim) ![](https://img.shields.io/github/last-commit/niuiic/fcitx.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/fcitx.nvim)
- [niuiic/git-log.nvim](https://github.com/niuiic/git-log.nvim) ![](https://img.shields.io/github/stars/niuiic/git-log.nvim) ![](https://img.shields.io/github/last-commit/niuiic/git-log.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/git-log.nvim)
- [niuiic/lsp-utils.nvim](https://github.com/niuiic/lsp-utils.nvim) ![](https://img.shields.io/github/stars/niuiic/lsp-utils.nvim) ![](https://img.shields.io/github/last-commit/niuiic/lsp-utils.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/lsp-utils.nvim)
- [niuiic/multiple-session.nvim](https://github.com/niuiic/multiple-session.nvim) ![](https://img.shields.io/github/stars/niuiic/multiple-session.nvim) ![](https://img.shields.io/github/last-commit/niuiic/multiple-session.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/multiple-session.nvim)
- [niuiic/part-edit.nvim](https://github.com/niuiic/part-edit.nvim) ![](https://img.shields.io/github/stars/niuiic/part-edit.nvim) ![](https://img.shields.io/github/last-commit/niuiic/part-edit.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/part-edit.nvim)
- [niuiic/quickfix.nvim](https://github.com/niuiic/quickfix.nvim) ![](https://img.shields.io/github/stars/niuiic/quickfix.nvim) ![](https://img.shields.io/github/last-commit/niuiic/quickfix.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/quickfix.nvim)
- [niuiic/remote.nvim](https://github.com/niuiic/remote.nvim) ![](https://img.shields.io/github/stars/niuiic/remote.nvim) ![](https://img.shields.io/github/last-commit/niuiic/remote.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/remote.nvim)
- [niuiic/task.nvim](https://github.com/niuiic/task.nvim) ![](https://img.shields.io/github/stars/niuiic/task.nvim) ![](https://img.shields.io/github/last-commit/niuiic/task.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/task.nvim)
- [niuiic/terminal.nvim](https://github.com/niuiic/terminal.nvim) ![](https://img.shields.io/github/stars/niuiic/terminal.nvim) ![](https://img.shields.io/github/last-commit/niuiic/terminal.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/terminal.nvim)
- [niuiic/track.nvim](https://github.com/niuiic/track.nvim) ![](https://img.shields.io/github/stars/niuiic/track.nvim) ![](https://img.shields.io/github/last-commit/niuiic/track.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/track.nvim)
- [niuiic/translate.nvim](https://github.com/niuiic/translate.nvim) ![](https://img.shields.io/github/stars/niuiic/translate.nvim) ![](https://img.shields.io/github/last-commit/niuiic/translate.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/translate.nvim)
- [niuiic/window.nvim](https://github.com/niuiic/window.nvim) ![](https://img.shields.io/github/stars/niuiic/window.nvim) ![](https://img.shields.io/github/last-commit/niuiic/window.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/window.nvim)
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) ![](https://img.shields.io/github/stars/nvim-lua/plenary.nvim) ![](https://img.shields.io/github/last-commit/nvim-lua/plenary.nvim) ![](https://img.shields.io/github/commit-activity/y/nvim-lua/plenary.nvim)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) ![](https://img.shields.io/github/stars/nvim-lualine/lualine.nvim) ![](https://img.shields.io/github/last-commit/nvim-lualine/lualine.nvim) ![](https://img.shields.io/github/commit-activity/y/nvim-lualine/lualine.nvim)
- [nvim-neotest/neotest](https://github.com/nvim-neotest/neotest) ![](https://img.shields.io/github/stars/nvim-neotest/neotest) ![](https://img.shields.io/github/last-commit/nvim-neotest/neotest) ![](https://img.shields.io/github/commit-activity/y/nvim-neotest/neotest)
- [nvim-neotest/neotest-python](https://github.com/nvim-neotest/neotest-python) ![](https://img.shields.io/github/stars/nvim-neotest/neotest-python) ![](https://img.shields.io/github/last-commit/nvim-neotest/neotest-python) ![](https://img.shields.io/github/commit-activity/y/nvim-neotest/neotest-python)
- [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio) ![](https://img.shields.io/github/stars/nvim-neotest/nvim-nio) ![](https://img.shields.io/github/last-commit/nvim-neotest/nvim-nio) ![](https://img.shields.io/github/commit-activity/y/nvim-neotest/nvim-nio)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) ![](https://img.shields.io/github/stars/nvim-telescope/telescope.nvim) ![](https://img.shields.io/github/last-commit/nvim-telescope/telescope.nvim) ![](https://img.shields.io/github/commit-activity/y/nvim-telescope/telescope.nvim)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) ![](https://img.shields.io/github/stars/nvim-treesitter/nvim-treesitter) ![](https://img.shields.io/github/last-commit/nvim-treesitter/nvim-treesitter) ![](https://img.shields.io/github/commit-activity/y/nvim-treesitter/nvim-treesitter)
- [ofirgall/goto-breakpoints.nvim](https://github.com/ofirgall/goto-breakpoints.nvim) ![](https://img.shields.io/github/stars/ofirgall/goto-breakpoints.nvim) ![](https://img.shields.io/github/last-commit/ofirgall/goto-breakpoints.nvim) ![](https://img.shields.io/github/commit-activity/y/ofirgall/goto-breakpoints.nvim)
- [rachartier/tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim) ![](https://img.shields.io/github/stars/rachartier/tiny-inline-diagnostic.nvim) ![](https://img.shields.io/github/last-commit/rachartier/tiny-inline-diagnostic.nvim) ![](https://img.shields.io/github/commit-activity/y/rachartier/tiny-inline-diagnostic.nvim)
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) ![](https://img.shields.io/github/stars/rafamadriz/friendly-snippets) ![](https://img.shields.io/github/last-commit/rafamadriz/friendly-snippets) ![](https://img.shields.io/github/commit-activity/y/rafamadriz/friendly-snippets)
- [ray-x/cmp-treesitter](https://github.com/ray-x/cmp-treesitter) ![](https://img.shields.io/github/stars/ray-x/cmp-treesitter) ![](https://img.shields.io/github/last-commit/ray-x/cmp-treesitter) ![](https://img.shields.io/github/commit-activity/y/ray-x/cmp-treesitter)
- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) ![](https://img.shields.io/github/stars/rcarriga/nvim-dap-ui) ![](https://img.shields.io/github/last-commit/rcarriga/nvim-dap-ui) ![](https://img.shields.io/github/commit-activity/y/rcarriga/nvim-dap-ui)
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) ![](https://img.shields.io/github/stars/rcarriga/nvim-notify) ![](https://img.shields.io/github/last-commit/rcarriga/nvim-notify) ![](https://img.shields.io/github/commit-activity/y/rcarriga/nvim-notify)
- [rktjmp/highlight-current-n.nvim](https://github.com/rktjmp/highlight-current-n.nvim) ![](https://img.shields.io/github/stars/rktjmp/highlight-current-n.nvim) ![](https://img.shields.io/github/last-commit/rktjmp/highlight-current-n.nvim) ![](https://img.shields.io/github/commit-activity/y/rktjmp/highlight-current-n.nvim)
- [rouge8/neotest-rust](https://github.com/rouge8/neotest-rust) ![](https://img.shields.io/github/stars/rouge8/neotest-rust) ![](https://img.shields.io/github/last-commit/rouge8/neotest-rust) ![](https://img.shields.io/github/commit-activity/y/rouge8/neotest-rust)
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) ![](https://img.shields.io/github/stars/saadparwaiz1/cmp_luasnip) ![](https://img.shields.io/github/last-commit/saadparwaiz1/cmp_luasnip) ![](https://img.shields.io/github/commit-activity/y/saadparwaiz1/cmp_luasnip)
- [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim) ![](https://img.shields.io/github/stars/sindrets/diffview.nvim) ![](https://img.shields.io/github/last-commit/sindrets/diffview.nvim) ![](https://img.shields.io/github/commit-activity/y/sindrets/diffview.nvim)
- [sitiom/nvim-numbertoggle](https://github.com/sitiom/nvim-numbertoggle) ![](https://img.shields.io/github/stars/sitiom/nvim-numbertoggle) ![](https://img.shields.io/github/last-commit/sitiom/nvim-numbertoggle) ![](https://img.shields.io/github/commit-activity/y/sitiom/nvim-numbertoggle)
- [smartpde/telescope-recent-files](https://github.com/smartpde/telescope-recent-files) ![](https://img.shields.io/github/stars/smartpde/telescope-recent-files) ![](https://img.shields.io/github/last-commit/smartpde/telescope-recent-files) ![](https://img.shields.io/github/commit-activity/y/smartpde/telescope-recent-files)
- [sontungexpt/url-open](https://github.com/sontungexpt/url-open) ![](https://img.shields.io/github/stars/sontungexpt/url-open) ![](https://img.shields.io/github/last-commit/sontungexpt/url-open) ![](https://img.shields.io/github/commit-activity/y/sontungexpt/url-open)
- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) ![](https://img.shields.io/github/stars/stevearc/dressing.nvim) ![](https://img.shields.io/github/last-commit/stevearc/dressing.nvim) ![](https://img.shields.io/github/commit-activity/y/stevearc/dressing.nvim)
- [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) ![](https://img.shields.io/github/stars/theHamsta/nvim-dap-virtual-text) ![](https://img.shields.io/github/last-commit/theHamsta/nvim-dap-virtual-text) ![](https://img.shields.io/github/commit-activity/y/theHamsta/nvim-dap-virtual-text)
- [tzachar/local-highlight.nvim](https://github.com/tzachar/local-highlight.nvim) ![](https://img.shields.io/github/stars/tzachar/local-highlight.nvim) ![](https://img.shields.io/github/last-commit/tzachar/local-highlight.nvim) ![](https://img.shields.io/github/commit-activity/y/tzachar/local-highlight.nvim)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) ![](https://img.shields.io/github/stars/williamboman/mason.nvim) ![](https://img.shields.io/github/last-commit/williamboman/mason.nvim) ![](https://img.shields.io/github/commit-activity/y/williamboman/mason.nvim)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) ![](https://img.shields.io/github/stars/windwp/nvim-autopairs) ![](https://img.shields.io/github/last-commit/windwp/nvim-autopairs) ![](https://img.shields.io/github/commit-activity/y/windwp/nvim-autopairs)
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) ![](https://img.shields.io/github/stars/windwp/nvim-ts-autotag) ![](https://img.shields.io/github/last-commit/windwp/nvim-ts-autotag) ![](https://img.shields.io/github/commit-activity/y/windwp/nvim-ts-autotag)
- [yioneko/nvim-vtsls](https://github.com/yioneko/nvim-vtsls) ![](https://img.shields.io/github/stars/yioneko/nvim-vtsls) ![](https://img.shields.io/github/last-commit/yioneko/nvim-vtsls) ![](https://img.shields.io/github/commit-activity/y/yioneko/nvim-vtsls)
- [zjp-CN/nvim-cmp-lsp-rs](https://github.com/zjp-CN/nvim-cmp-lsp-rs) ![](https://img.shields.io/github/stars/zjp-CN/nvim-cmp-lsp-rs) ![](https://img.shields.io/github/last-commit/zjp-CN/nvim-cmp-lsp-rs) ![](https://img.shields.io/github/commit-activity/y/zjp-CN/nvim-cmp-lsp-rs)
- [Bilal2453/luvit-meta](https://github.com/Bilal2453/luvit-meta) ![](https://img.shields.io/github/stars/Bilal2453/luvit-meta) ![](https://img.shields.io/github/last-commit/Bilal2453/luvit-meta) ![](https://img.shields.io/github/commit-activity/y/Bilal2453/luvit-meta)
- [FelipeLema/cmp-async-path](https://github.com/FelipeLema/cmp-async-path) ![](https://img.shields.io/github/stars/FelipeLema/cmp-async-path) ![](https://img.shields.io/github/last-commit/FelipeLema/cmp-async-path) ![](https://img.shields.io/github/commit-activity/y/FelipeLema/cmp-async-path)
- [HiPhish/rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) ![](https://img.shields.io/github/stars/HiPhish/rainbow-delimiters.nvim) ![](https://img.shields.io/github/last-commit/HiPhish/rainbow-delimiters.nvim) ![](https://img.shields.io/github/commit-activity/y/HiPhish/rainbow-delimiters.nvim)
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) ![](https://img.shields.io/github/stars/L3MON4D3/LuaSnip) ![](https://img.shields.io/github/last-commit/L3MON4D3/LuaSnip) ![](https://img.shields.io/github/commit-activity/y/L3MON4D3/LuaSnip)
- [LiadOz/nvim-dap-repl-highlights](https://github.com/LiadOz/nvim-dap-repl-highlights) ![](https://img.shields.io/github/stars/LiadOz/nvim-dap-repl-highlights) ![](https://img.shields.io/github/last-commit/LiadOz/nvim-dap-repl-highlights) ![](https://img.shields.io/github/commit-activity/y/LiadOz/nvim-dap-repl-highlights)
- [MagicDuck/grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) ![](https://img.shields.io/github/stars/MagicDuck/grug-far.nvim) ![](https://img.shields.io/github/last-commit/MagicDuck/grug-far.nvim) ![](https://img.shields.io/github/commit-activity/y/MagicDuck/grug-far.nvim)
- [Mr-LLLLL/treesitter-outer](https://github.com/Mr-LLLLL/treesitter-outer) ![](https://img.shields.io/github/stars/Mr-LLLLL/treesitter-outer) ![](https://img.shields.io/github/last-commit/Mr-LLLLL/treesitter-outer) ![](https://img.shields.io/github/commit-activity/y/Mr-LLLLL/treesitter-outer)
- [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) ![](https://img.shields.io/github/stars/MunifTanjim/nui.nvim) ![](https://img.shields.io/github/last-commit/MunifTanjim/nui.nvim) ![](https://img.shields.io/github/commit-activity/y/MunifTanjim/nui.nvim)
- [Wansmer/treesj](https://github.com/Wansmer/treesj) ![](https://img.shields.io/github/stars/Wansmer/treesj) ![](https://img.shields.io/github/last-commit/Wansmer/treesj) ![](https://img.shields.io/github/commit-activity/y/Wansmer/treesj)
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) ![](https://img.shields.io/github/stars/akinsho/bufferline.nvim) ![](https://img.shields.io/github/last-commit/akinsho/bufferline.nvim) ![](https://img.shields.io/github/commit-activity/y/akinsho/bufferline.nvim)
- [andrewferrier/debugprint.nvim](https://github.com/andrewferrier/debugprint.nvim) ![](https://img.shields.io/github/stars/andrewferrier/debugprint.nvim) ![](https://img.shields.io/github/last-commit/andrewferrier/debugprint.nvim) ![](https://img.shields.io/github/commit-activity/y/andrewferrier/debugprint.nvim)
- [andymass/vim-matchup](https://github.com/andymass/vim-matchup) ![](https://img.shields.io/github/stars/andymass/vim-matchup) ![](https://img.shields.io/github/last-commit/andymass/vim-matchup) ![](https://img.shields.io/github/commit-activity/y/andymass/vim-matchup)
- [andythigpen/nvim-coverage](https://github.com/andythigpen/nvim-coverage) ![](https://img.shields.io/github/stars/andythigpen/nvim-coverage) ![](https://img.shields.io/github/last-commit/andythigpen/nvim-coverage) ![](https://img.shields.io/github/commit-activity/y/andythigpen/nvim-coverage)
- [antoinemadec/FixCursorHold.nvim](https://github.com/antoinemadec/FixCursorHold.nvim) ![](https://img.shields.io/github/stars/antoinemadec/FixCursorHold.nvim) ![](https://img.shields.io/github/last-commit/antoinemadec/FixCursorHold.nvim) ![](https://img.shields.io/github/commit-activity/y/antoinemadec/FixCursorHold.nvim)
- [brenoprata10/nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) ![](https://img.shields.io/github/stars/brenoprata10/nvim-highlight-colors) ![](https://img.shields.io/github/last-commit/brenoprata10/nvim-highlight-colors) ![](https://img.shields.io/github/commit-activity/y/brenoprata10/nvim-highlight-colors)
- [chomosuke/typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim) ![](https://img.shields.io/github/stars/chomosuke/typst-preview.nvim) ![](https://img.shields.io/github/last-commit/chomosuke/typst-preview.nvim) ![](https://img.shields.io/github/commit-activity/y/chomosuke/typst-preview.nvim)
- [chrisgrieser/nvim-rip-substitute](https://github.com/chrisgrieser/nvim-rip-substitute) ![](https://img.shields.io/github/stars/chrisgrieser/nvim-rip-substitute) ![](https://img.shields.io/github/last-commit/chrisgrieser/nvim-rip-substitute) ![](https://img.shields.io/github/commit-activity/y/chrisgrieser/nvim-rip-substitute)
- [cljoly/telescope-repo.nvim](https://github.com/cljoly/telescope-repo.nvim) ![](https://img.shields.io/github/stars/cljoly/telescope-repo.nvim) ![](https://img.shields.io/github/last-commit/cljoly/telescope-repo.nvim) ![](https://img.shields.io/github/commit-activity/y/cljoly/telescope-repo.nvim)
- [cshuaimin/ssr.nvim](https://github.com/cshuaimin/ssr.nvim) ![](https://img.shields.io/github/stars/cshuaimin/ssr.nvim) ![](https://img.shields.io/github/last-commit/cshuaimin/ssr.nvim) ![](https://img.shields.io/github/commit-activity/y/cshuaimin/ssr.nvim)
- [danymat/neogen](https://github.com/danymat/neogen) ![](https://img.shields.io/github/stars/danymat/neogen) ![](https://img.shields.io/github/last-commit/danymat/neogen) ![](https://img.shields.io/github/commit-activity/y/danymat/neogen)
- [debugloop/telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim) ![](https://img.shields.io/github/stars/debugloop/telescope-undo.nvim) ![](https://img.shields.io/github/last-commit/debugloop/telescope-undo.nvim) ![](https://img.shields.io/github/commit-activity/y/debugloop/telescope-undo.nvim)
- [dmitmel/cmp-cmdline-history](https://github.com/dmitmel/cmp-cmdline-history) ![](https://img.shields.io/github/stars/dmitmel/cmp-cmdline-history) ![](https://img.shields.io/github/last-commit/dmitmel/cmp-cmdline-history) ![](https://img.shields.io/github/commit-activity/y/dmitmel/cmp-cmdline-history)
- [dmmulroy/ts-error-translator.nvim](https://github.com/dmmulroy/ts-error-translator.nvim) ![](https://img.shields.io/github/stars/dmmulroy/ts-error-translator.nvim) ![](https://img.shields.io/github/last-commit/dmmulroy/ts-error-translator.nvim) ![](https://img.shields.io/github/commit-activity/y/dmmulroy/ts-error-translator.nvim)
- [dstein64/vim-startuptime](https://github.com/dstein64/vim-startuptime) ![](https://img.shields.io/github/stars/dstein64/vim-startuptime) ![](https://img.shields.io/github/last-commit/dstein64/vim-startuptime) ![](https://img.shields.io/github/commit-activity/y/dstein64/vim-startuptime)
- [echasnovski/mini.bufremove](https://github.com/echasnovski/mini.bufremove) ![](https://img.shields.io/github/stars/echasnovski/mini.bufremove) ![](https://img.shields.io/github/last-commit/echasnovski/mini.bufremove) ![](https://img.shields.io/github/commit-activity/y/echasnovski/mini.bufremove)
- [echasnovski/mini.comment](https://github.com/echasnovski/mini.comment) ![](https://img.shields.io/github/stars/echasnovski/mini.comment) ![](https://img.shields.io/github/last-commit/echasnovski/mini.comment) ![](https://img.shields.io/github/commit-activity/y/echasnovski/mini.comment)
- [echasnovski/mini.indentscope](https://github.com/echasnovski/mini.indentscope) ![](https://img.shields.io/github/stars/echasnovski/mini.indentscope) ![](https://img.shields.io/github/last-commit/echasnovski/mini.indentscope) ![](https://img.shields.io/github/commit-activity/y/echasnovski/mini.indentscope)
- [echasnovski/mini.move](https://github.com/echasnovski/mini.move) ![](https://img.shields.io/github/stars/echasnovski/mini.move) ![](https://img.shields.io/github/last-commit/echasnovski/mini.move) ![](https://img.shields.io/github/commit-activity/y/echasnovski/mini.move)
- [ecthelionvi/NeoColumn.nvim](https://github.com/ecthelionvi/NeoColumn.nvim) ![](https://img.shields.io/github/stars/ecthelionvi/NeoColumn.nvim) ![](https://img.shields.io/github/last-commit/ecthelionvi/NeoColumn.nvim) ![](https://img.shields.io/github/commit-activity/y/ecthelionvi/NeoColumn.nvim)
- [folke/flash.nvim](https://github.com/folke/flash.nvim) ![](https://img.shields.io/github/stars/folke/flash.nvim) ![](https://img.shields.io/github/last-commit/folke/flash.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/flash.nvim)
- [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim) ![](https://img.shields.io/github/stars/folke/lazydev.nvim) ![](https://img.shields.io/github/last-commit/folke/lazydev.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/lazydev.nvim)
- [folke/lsp-colors.nvim](https://github.com/folke/lsp-colors.nvim) ![](https://img.shields.io/github/stars/folke/lsp-colors.nvim) ![](https://img.shields.io/github/last-commit/folke/lsp-colors.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/lsp-colors.nvim)
- [folke/noice.nvim](https://github.com/folke/noice.nvim) ![](https://img.shields.io/github/stars/folke/noice.nvim) ![](https://img.shields.io/github/last-commit/folke/noice.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/noice.nvim)
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) ![](https://img.shields.io/github/stars/folke/todo-comments.nvim) ![](https://img.shields.io/github/last-commit/folke/todo-comments.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/todo-comments.nvim)
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) ![](https://img.shields.io/github/stars/folke/tokyonight.nvim) ![](https://img.shields.io/github/last-commit/folke/tokyonight.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/tokyonight.nvim)
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim) ![](https://img.shields.io/github/stars/folke/trouble.nvim) ![](https://img.shields.io/github/last-commit/folke/trouble.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/trouble.nvim)
- [folke/ts-comments.nvim](https://github.com/folke/ts-comments.nvim) ![](https://img.shields.io/github/stars/folke/ts-comments.nvim) ![](https://img.shields.io/github/last-commit/folke/ts-comments.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/ts-comments.nvim)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim) ![](https://img.shields.io/github/stars/folke/which-key.nvim) ![](https://img.shields.io/github/last-commit/folke/which-key.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/which-key.nvim)
- [gbprod/yanky.nvim](https://github.com/gbprod/yanky.nvim) ![](https://img.shields.io/github/stars/gbprod/yanky.nvim) ![](https://img.shields.io/github/last-commit/gbprod/yanky.nvim) ![](https://img.shields.io/github/commit-activity/y/gbprod/yanky.nvim)
- [glepnir/lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) ![](https://img.shields.io/github/stars/glepnir/lspsaga.nvim) ![](https://img.shields.io/github/last-commit/glepnir/lspsaga.nvim) ![](https://img.shields.io/github/commit-activity/y/glepnir/lspsaga.nvim)
- [haydenmeade/neotest-jest](https://github.com/haydenmeade/neotest-jest) ![](https://img.shields.io/github/stars/haydenmeade/neotest-jest) ![](https://img.shields.io/github/last-commit/haydenmeade/neotest-jest) ![](https://img.shields.io/github/commit-activity/y/haydenmeade/neotest-jest)
- [hedyhli/outline.nvim](https://github.com/hedyhli/outline.nvim) ![](https://img.shields.io/github/stars/hedyhli/outline.nvim) ![](https://img.shields.io/github/last-commit/hedyhli/outline.nvim) ![](https://img.shields.io/github/commit-activity/y/hedyhli/outline.nvim)
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) ![](https://img.shields.io/github/stars/hrsh7th/cmp-buffer) ![](https://img.shields.io/github/last-commit/hrsh7th/cmp-buffer) ![](https://img.shields.io/github/commit-activity/y/hrsh7th/cmp-buffer)
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) ![](https://img.shields.io/github/stars/hrsh7th/cmp-cmdline) ![](https://img.shields.io/github/last-commit/hrsh7th/cmp-cmdline) ![](https://img.shields.io/github/commit-activity/y/hrsh7th/cmp-cmdline)
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) ![](https://img.shields.io/github/stars/hrsh7th/cmp-nvim-lsp) ![](https://img.shields.io/github/last-commit/hrsh7th/cmp-nvim-lsp) ![](https://img.shields.io/github/commit-activity/y/hrsh7th/cmp-nvim-lsp)
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) ![](https://img.shields.io/github/stars/hrsh7th/nvim-cmp) ![](https://img.shields.io/github/last-commit/hrsh7th/nvim-cmp) ![](https://img.shields.io/github/commit-activity/y/hrsh7th/nvim-cmp)
- [jbyuki/one-small-step-for-vimkind](https://github.com/jbyuki/one-small-step-for-vimkind) ![](https://img.shields.io/github/stars/jbyuki/one-small-step-for-vimkind) ![](https://img.shields.io/github/last-commit/jbyuki/one-small-step-for-vimkind) ![](https://img.shields.io/github/commit-activity/y/jbyuki/one-small-step-for-vimkind)
- [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) ![](https://img.shields.io/github/stars/kdheepak/lazygit.nvim) ![](https://img.shields.io/github/last-commit/kdheepak/lazygit.nvim) ![](https://img.shields.io/github/commit-activity/y/kdheepak/lazygit.nvim)
- [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) ![](https://img.shields.io/github/stars/kevinhwang91/nvim-ufo) ![](https://img.shields.io/github/last-commit/kevinhwang91/nvim-ufo) ![](https://img.shields.io/github/commit-activity/y/kevinhwang91/nvim-ufo)
- [kevinhwang91/promise-async](https://github.com/kevinhwang91/promise-async) ![](https://img.shields.io/github/stars/kevinhwang91/promise-async) ![](https://img.shields.io/github/last-commit/kevinhwang91/promise-async) ![](https://img.shields.io/github/commit-activity/y/kevinhwang91/promise-async)
- [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) ![](https://img.shields.io/github/stars/kyazdani42/nvim-tree.lua) ![](https://img.shields.io/github/last-commit/kyazdani42/nvim-tree.lua) ![](https://img.shields.io/github/commit-activity/y/kyazdani42/nvim-tree.lua)
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) ![](https://img.shields.io/github/stars/kyazdani42/nvim-web-devicons) ![](https://img.shields.io/github/last-commit/kyazdani42/nvim-web-devicons) ![](https://img.shields.io/github/commit-activity/y/kyazdani42/nvim-web-devicons)
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) ![](https://img.shields.io/github/stars/kylechui/nvim-surround) ![](https://img.shields.io/github/last-commit/kylechui/nvim-surround) ![](https://img.shields.io/github/commit-activity/y/kylechui/nvim-surround)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) ![](https://img.shields.io/github/stars/lewis6991/gitsigns.nvim) ![](https://img.shields.io/github/last-commit/lewis6991/gitsigns.nvim) ![](https://img.shields.io/github/commit-activity/y/lewis6991/gitsigns.nvim)
- [lukas-reineke/cmp-rg](https://github.com/lukas-reineke/cmp-rg) ![](https://img.shields.io/github/stars/lukas-reineke/cmp-rg) ![](https://img.shields.io/github/last-commit/lukas-reineke/cmp-rg) ![](https://img.shields.io/github/commit-activity/y/lukas-reineke/cmp-rg)
- [luozhiya/fittencode.nvim](https://github.com/luozhiya/fittencode.nvim) ![](https://img.shields.io/github/stars/luozhiya/fittencode.nvim) ![](https://img.shields.io/github/last-commit/luozhiya/fittencode.nvim) ![](https://img.shields.io/github/commit-activity/y/luozhiya/fittencode.nvim)
- [m-demare/hlargs.nvim](https://github.com/m-demare/hlargs.nvim) ![](https://img.shields.io/github/stars/m-demare/hlargs.nvim) ![](https://img.shields.io/github/last-commit/m-demare/hlargs.nvim) ![](https://img.shields.io/github/commit-activity/y/m-demare/hlargs.nvim)
- [marilari88/neotest-vitest](https://github.com/marilari88/neotest-vitest) ![](https://img.shields.io/github/stars/marilari88/neotest-vitest) ![](https://img.shields.io/github/last-commit/marilari88/neotest-vitest) ![](https://img.shields.io/github/commit-activity/y/marilari88/neotest-vitest)
- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) ![](https://img.shields.io/github/stars/mfussenegger/nvim-dap) ![](https://img.shields.io/github/last-commit/mfussenegger/nvim-dap) ![](https://img.shields.io/github/commit-activity/y/mfussenegger/nvim-dap)
- [mxsdev/nvim-dap-vscode-js](https://github.com/mxsdev/nvim-dap-vscode-js) ![](https://img.shields.io/github/stars/mxsdev/nvim-dap-vscode-js) ![](https://img.shields.io/github/last-commit/mxsdev/nvim-dap-vscode-js) ![](https://img.shields.io/github/commit-activity/y/mxsdev/nvim-dap-vscode-js)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) ![](https://img.shields.io/github/stars/neovim/nvim-lspconfig) ![](https://img.shields.io/github/last-commit/neovim/nvim-lspconfig) ![](https://img.shields.io/github/commit-activity/y/neovim/nvim-lspconfig)
- [niuiic/code-shot.nvim](https://github.com/niuiic/code-shot.nvim) ![](https://img.shields.io/github/stars/niuiic/code-shot.nvim) ![](https://img.shields.io/github/last-commit/niuiic/code-shot.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/code-shot.nvim)
- [niuiic/core.nvim](https://github.com/niuiic/core.nvim) ![](https://img.shields.io/github/stars/niuiic/core.nvim) ![](https://img.shields.io/github/last-commit/niuiic/core.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/core.nvim)
- [niuiic/cp-image.nvim](https://github.com/niuiic/cp-image.nvim) ![](https://img.shields.io/github/stars/niuiic/cp-image.nvim) ![](https://img.shields.io/github/last-commit/niuiic/cp-image.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/cp-image.nvim)
- [niuiic/dap-utils.nvim](https://github.com/niuiic/dap-utils.nvim) ![](https://img.shields.io/github/stars/niuiic/dap-utils.nvim) ![](https://img.shields.io/github/last-commit/niuiic/dap-utils.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/dap-utils.nvim)
- [niuiic/divider.nvim](https://github.com/niuiic/divider.nvim) ![](https://img.shields.io/github/stars/niuiic/divider.nvim) ![](https://img.shields.io/github/last-commit/niuiic/divider.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/divider.nvim)
- [niuiic/fcitx.nvim](https://github.com/niuiic/fcitx.nvim) ![](https://img.shields.io/github/stars/niuiic/fcitx.nvim) ![](https://img.shields.io/github/last-commit/niuiic/fcitx.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/fcitx.nvim)
- [niuiic/format.nvim](https://github.com/niuiic/format.nvim) ![](https://img.shields.io/github/stars/niuiic/format.nvim) ![](https://img.shields.io/github/last-commit/niuiic/format.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/format.nvim)
- [niuiic/git-log.nvim](https://github.com/niuiic/git-log.nvim) ![](https://img.shields.io/github/stars/niuiic/git-log.nvim) ![](https://img.shields.io/github/last-commit/niuiic/git-log.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/git-log.nvim)
- [niuiic/lsp-utils.nvim](https://github.com/niuiic/lsp-utils.nvim) ![](https://img.shields.io/github/stars/niuiic/lsp-utils.nvim) ![](https://img.shields.io/github/last-commit/niuiic/lsp-utils.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/lsp-utils.nvim)
- [niuiic/multiple-session.nvim](https://github.com/niuiic/multiple-session.nvim) ![](https://img.shields.io/github/stars/niuiic/multiple-session.nvim) ![](https://img.shields.io/github/last-commit/niuiic/multiple-session.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/multiple-session.nvim)
- [niuiic/part-edit.nvim](https://github.com/niuiic/part-edit.nvim) ![](https://img.shields.io/github/stars/niuiic/part-edit.nvim) ![](https://img.shields.io/github/last-commit/niuiic/part-edit.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/part-edit.nvim)
- [niuiic/quickfix.nvim](https://github.com/niuiic/quickfix.nvim) ![](https://img.shields.io/github/stars/niuiic/quickfix.nvim) ![](https://img.shields.io/github/last-commit/niuiic/quickfix.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/quickfix.nvim)
- [niuiic/remote.nvim](https://github.com/niuiic/remote.nvim) ![](https://img.shields.io/github/stars/niuiic/remote.nvim) ![](https://img.shields.io/github/last-commit/niuiic/remote.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/remote.nvim)
- [niuiic/scroll.nvim](https://github.com/niuiic/scroll.nvim) ![](https://img.shields.io/github/stars/niuiic/scroll.nvim) ![](https://img.shields.io/github/last-commit/niuiic/scroll.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/scroll.nvim)
- [niuiic/task.nvim](https://github.com/niuiic/task.nvim) ![](https://img.shields.io/github/stars/niuiic/task.nvim) ![](https://img.shields.io/github/last-commit/niuiic/task.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/task.nvim)
- [niuiic/terminal.nvim](https://github.com/niuiic/terminal.nvim) ![](https://img.shields.io/github/stars/niuiic/terminal.nvim) ![](https://img.shields.io/github/last-commit/niuiic/terminal.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/terminal.nvim)
- [niuiic/track.nvim](https://github.com/niuiic/track.nvim) ![](https://img.shields.io/github/stars/niuiic/track.nvim) ![](https://img.shields.io/github/last-commit/niuiic/track.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/track.nvim)
- [niuiic/translate.nvim](https://github.com/niuiic/translate.nvim) ![](https://img.shields.io/github/stars/niuiic/translate.nvim) ![](https://img.shields.io/github/last-commit/niuiic/translate.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/translate.nvim)
- [niuiic/window.nvim](https://github.com/niuiic/window.nvim) ![](https://img.shields.io/github/stars/niuiic/window.nvim) ![](https://img.shields.io/github/last-commit/niuiic/window.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/window.nvim)
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) ![](https://img.shields.io/github/stars/nvim-lua/plenary.nvim) ![](https://img.shields.io/github/last-commit/nvim-lua/plenary.nvim) ![](https://img.shields.io/github/commit-activity/y/nvim-lua/plenary.nvim)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) ![](https://img.shields.io/github/stars/nvim-lualine/lualine.nvim) ![](https://img.shields.io/github/last-commit/nvim-lualine/lualine.nvim) ![](https://img.shields.io/github/commit-activity/y/nvim-lualine/lualine.nvim)
- [nvim-neotest/neotest](https://github.com/nvim-neotest/neotest) ![](https://img.shields.io/github/stars/nvim-neotest/neotest) ![](https://img.shields.io/github/last-commit/nvim-neotest/neotest) ![](https://img.shields.io/github/commit-activity/y/nvim-neotest/neotest)
- [nvim-neotest/neotest-python](https://github.com/nvim-neotest/neotest-python) ![](https://img.shields.io/github/stars/nvim-neotest/neotest-python) ![](https://img.shields.io/github/last-commit/nvim-neotest/neotest-python) ![](https://img.shields.io/github/commit-activity/y/nvim-neotest/neotest-python)
- [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio) ![](https://img.shields.io/github/stars/nvim-neotest/nvim-nio) ![](https://img.shields.io/github/last-commit/nvim-neotest/nvim-nio) ![](https://img.shields.io/github/commit-activity/y/nvim-neotest/nvim-nio)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) ![](https://img.shields.io/github/stars/nvim-telescope/telescope.nvim) ![](https://img.shields.io/github/last-commit/nvim-telescope/telescope.nvim) ![](https://img.shields.io/github/commit-activity/y/nvim-telescope/telescope.nvim)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) ![](https://img.shields.io/github/stars/nvim-treesitter/nvim-treesitter) ![](https://img.shields.io/github/last-commit/nvim-treesitter/nvim-treesitter) ![](https://img.shields.io/github/commit-activity/y/nvim-treesitter/nvim-treesitter)
- [ofirgall/goto-breakpoints.nvim](https://github.com/ofirgall/goto-breakpoints.nvim) ![](https://img.shields.io/github/stars/ofirgall/goto-breakpoints.nvim) ![](https://img.shields.io/github/last-commit/ofirgall/goto-breakpoints.nvim) ![](https://img.shields.io/github/commit-activity/y/ofirgall/goto-breakpoints.nvim)
- [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim) ![](https://img.shields.io/github/stars/onsails/lspkind-nvim) ![](https://img.shields.io/github/last-commit/onsails/lspkind-nvim) ![](https://img.shields.io/github/commit-activity/y/onsails/lspkind-nvim)
- [rachartier/tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim) ![](https://img.shields.io/github/stars/rachartier/tiny-inline-diagnostic.nvim) ![](https://img.shields.io/github/last-commit/rachartier/tiny-inline-diagnostic.nvim) ![](https://img.shields.io/github/commit-activity/y/rachartier/tiny-inline-diagnostic.nvim)
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) ![](https://img.shields.io/github/stars/rafamadriz/friendly-snippets) ![](https://img.shields.io/github/last-commit/rafamadriz/friendly-snippets) ![](https://img.shields.io/github/commit-activity/y/rafamadriz/friendly-snippets)
- [ray-x/cmp-treesitter](https://github.com/ray-x/cmp-treesitter) ![](https://img.shields.io/github/stars/ray-x/cmp-treesitter) ![](https://img.shields.io/github/last-commit/ray-x/cmp-treesitter) ![](https://img.shields.io/github/commit-activity/y/ray-x/cmp-treesitter)
- [rcarriga/cmp-dap](https://github.com/rcarriga/cmp-dap) ![](https://img.shields.io/github/stars/rcarriga/cmp-dap) ![](https://img.shields.io/github/last-commit/rcarriga/cmp-dap) ![](https://img.shields.io/github/commit-activity/y/rcarriga/cmp-dap)
- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) ![](https://img.shields.io/github/stars/rcarriga/nvim-dap-ui) ![](https://img.shields.io/github/last-commit/rcarriga/nvim-dap-ui) ![](https://img.shields.io/github/commit-activity/y/rcarriga/nvim-dap-ui)
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) ![](https://img.shields.io/github/stars/rcarriga/nvim-notify) ![](https://img.shields.io/github/last-commit/rcarriga/nvim-notify) ![](https://img.shields.io/github/commit-activity/y/rcarriga/nvim-notify)
- [rktjmp/highlight-current-n.nvim](https://github.com/rktjmp/highlight-current-n.nvim) ![](https://img.shields.io/github/stars/rktjmp/highlight-current-n.nvim) ![](https://img.shields.io/github/last-commit/rktjmp/highlight-current-n.nvim) ![](https://img.shields.io/github/commit-activity/y/rktjmp/highlight-current-n.nvim)
- [rouge8/neotest-rust](https://github.com/rouge8/neotest-rust) ![](https://img.shields.io/github/stars/rouge8/neotest-rust) ![](https://img.shields.io/github/last-commit/rouge8/neotest-rust) ![](https://img.shields.io/github/commit-activity/y/rouge8/neotest-rust)
- [s1n7ax/nvim-window-picker](https://github.com/s1n7ax/nvim-window-picker) ![](https://img.shields.io/github/stars/s1n7ax/nvim-window-picker) ![](https://img.shields.io/github/last-commit/s1n7ax/nvim-window-picker) ![](https://img.shields.io/github/commit-activity/y/s1n7ax/nvim-window-picker)
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) ![](https://img.shields.io/github/stars/saadparwaiz1/cmp_luasnip) ![](https://img.shields.io/github/last-commit/saadparwaiz1/cmp_luasnip) ![](https://img.shields.io/github/commit-activity/y/saadparwaiz1/cmp_luasnip)
- [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim) ![](https://img.shields.io/github/stars/sindrets/diffview.nvim) ![](https://img.shields.io/github/last-commit/sindrets/diffview.nvim) ![](https://img.shields.io/github/commit-activity/y/sindrets/diffview.nvim)
- [sitiom/nvim-numbertoggle](https://github.com/sitiom/nvim-numbertoggle) ![](https://img.shields.io/github/stars/sitiom/nvim-numbertoggle) ![](https://img.shields.io/github/last-commit/sitiom/nvim-numbertoggle) ![](https://img.shields.io/github/commit-activity/y/sitiom/nvim-numbertoggle)
- [smartpde/telescope-recent-files](https://github.com/smartpde/telescope-recent-files) ![](https://img.shields.io/github/stars/smartpde/telescope-recent-files) ![](https://img.shields.io/github/last-commit/smartpde/telescope-recent-files) ![](https://img.shields.io/github/commit-activity/y/smartpde/telescope-recent-files)
- [sontungexpt/url-open](https://github.com/sontungexpt/url-open) ![](https://img.shields.io/github/stars/sontungexpt/url-open) ![](https://img.shields.io/github/last-commit/sontungexpt/url-open) ![](https://img.shields.io/github/commit-activity/y/sontungexpt/url-open)
- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) ![](https://img.shields.io/github/stars/stevearc/dressing.nvim) ![](https://img.shields.io/github/last-commit/stevearc/dressing.nvim) ![](https://img.shields.io/github/commit-activity/y/stevearc/dressing.nvim)
- [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) ![](https://img.shields.io/github/stars/theHamsta/nvim-dap-virtual-text) ![](https://img.shields.io/github/last-commit/theHamsta/nvim-dap-virtual-text) ![](https://img.shields.io/github/commit-activity/y/theHamsta/nvim-dap-virtual-text)
- [tzachar/local-highlight.nvim](https://github.com/tzachar/local-highlight.nvim) ![](https://img.shields.io/github/stars/tzachar/local-highlight.nvim) ![](https://img.shields.io/github/last-commit/tzachar/local-highlight.nvim) ![](https://img.shields.io/github/commit-activity/y/tzachar/local-highlight.nvim)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) ![](https://img.shields.io/github/stars/williamboman/mason.nvim) ![](https://img.shields.io/github/last-commit/williamboman/mason.nvim) ![](https://img.shields.io/github/commit-activity/y/williamboman/mason.nvim)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) ![](https://img.shields.io/github/stars/windwp/nvim-autopairs) ![](https://img.shields.io/github/last-commit/windwp/nvim-autopairs) ![](https://img.shields.io/github/commit-activity/y/windwp/nvim-autopairs)
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) ![](https://img.shields.io/github/stars/windwp/nvim-ts-autotag) ![](https://img.shields.io/github/last-commit/windwp/nvim-ts-autotag) ![](https://img.shields.io/github/commit-activity/y/windwp/nvim-ts-autotag)
- [yioneko/nvim-vtsls](https://github.com/yioneko/nvim-vtsls) ![](https://img.shields.io/github/stars/yioneko/nvim-vtsls) ![](https://img.shields.io/github/last-commit/yioneko/nvim-vtsls) ![](https://img.shields.io/github/commit-activity/y/yioneko/nvim-vtsls)
- [zjp-CN/nvim-cmp-lsp-rs](https://github.com/zjp-CN/nvim-cmp-lsp-rs) ![](https://img.shields.io/github/stars/zjp-CN/nvim-cmp-lsp-rs) ![](https://img.shields.io/github/last-commit/zjp-CN/nvim-cmp-lsp-rs) ![](https://img.shields.io/github/commit-activity/y/zjp-CN/nvim-cmp-lsp-rs)
