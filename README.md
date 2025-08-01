# Modern Neovim Configuration

Neovim + Linux = Best Almighty IDE

> This configuration is for linux only.

## Mainly Supported Language/Framework List

- Rust
- Javascript/Typescript
- Python
- Shell
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

Terminal: WezTerm

Neovim: V0.10+

## Dependencies

1. `nodejs`, `rust` (required for `mason.nvim` and `nvim-treesitter`). Use `:h mason-requirements` to check more dependencies.
2. `rg`, `fd` command (required for `telescope.nvim`)
3. `fcitx5` (required for `fcitx.nvim`)
4. `translate-shell` (required for `translate.nvim`)
5. `cargo-nextest` (required for `neotest-rust.nvim`)
6. `nushell` (recommended)
7. `win32yank` (required for wsl)
8. `pumlformat` (required for plantuml)

## QuickStart

### Installation

1. Install all dependencies.

2. `git clone https://github.com/niuiic/modern-neovim-configuration ~/.config/nvim`

3. Open neovim and then all plugins would be installed automatically.

4. Install lsps, formatters, linters, debuggers with `mason.nvim`. Check `lua/plugin/mason.lua` for details.

5. Check if something is missing with `:checkhealth`.

6. Login to fitten with `Fitten login`.

7. Look for specific functions in `lua/plugins.lua`.

### Keymap

`which-key.nvim` will tell you. Check `lua/plugin/*` and `lua/keymap.lua` for details.

> leader: `\`

> localLeader: `<space>`

### LSP

Create `lspname.lua` in `lua/lsp`.

Update `lsp_list` in `lua/lsp/init.lua`.

### Formatter

Use your favorite formatters with [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim).

### DAP

Create `dapname.lua` in `lua/debugger`.

Update `debugger_list` in `lua/debugger/init.lua`.

### Custom Snippets

Create `filetype.json` in `snippets`.

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

## Plugins

- [Bilal2453/luvit-meta](https://github.com/Bilal2453/luvit-meta) - Meta type definitions for the Lua platform Luvit.

	![](https://img.shields.io/github/stars/Bilal2453/luvit-meta) ![](https://img.shields.io/github/last-commit/Bilal2453/luvit-meta) ![](https://img.shields.io/github/commit-activity/y/Bilal2453/luvit-meta)
- [HiPhish/rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) - Rainbow delimiters for Neovim with Tree-sitter

	![](https://img.shields.io/github/stars/HiPhish/rainbow-delimiters.nvim) ![](https://img.shields.io/github/last-commit/HiPhish/rainbow-delimiters.nvim) ![](https://img.shields.io/github/commit-activity/y/HiPhish/rainbow-delimiters.nvim)
- [LiadOz/nvim-dap-repl-highlights](https://github.com/LiadOz/nvim-dap-repl-highlights) - Add syntax highlighting to the nvim-dap REPL

	![](https://img.shields.io/github/stars/LiadOz/nvim-dap-repl-highlights) ![](https://img.shields.io/github/last-commit/LiadOz/nvim-dap-repl-highlights) ![](https://img.shields.io/github/commit-activity/y/LiadOz/nvim-dap-repl-highlights)
- [MagicDuck/grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) - Find And Replace plugin for neovim

	![](https://img.shields.io/github/stars/MagicDuck/grug-far.nvim) ![](https://img.shields.io/github/last-commit/MagicDuck/grug-far.nvim) ![](https://img.shields.io/github/commit-activity/y/MagicDuck/grug-far.nvim)
- [MatrosMartz/neotest-deno](https://github.com/MatrosMartz/neotest-deno) - Neotest adapter for Deno.

	![](https://img.shields.io/github/stars/MatrosMartz/neotest-deno) ![](https://img.shields.io/github/last-commit/MatrosMartz/neotest-deno) ![](https://img.shields.io/github/commit-activity/y/MatrosMartz/neotest-deno)
- [Mr-LLLLL/treesitter-outer](https://github.com/Mr-LLLLL/treesitter-outer) - Jump outer node smartly

	![](https://img.shields.io/github/stars/Mr-LLLLL/treesitter-outer) ![](https://img.shields.io/github/last-commit/Mr-LLLLL/treesitter-outer) ![](https://img.shields.io/github/commit-activity/y/Mr-LLLLL/treesitter-outer)
- [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) - UI Component Library for Neovim.

	![](https://img.shields.io/github/stars/MunifTanjim/nui.nvim) ![](https://img.shields.io/github/last-commit/MunifTanjim/nui.nvim) ![](https://img.shields.io/github/commit-activity/y/MunifTanjim/nui.nvim)
- [Saghen/blink.cmp](https://github.com/Saghen/blink.cmp) - Performant, batteries-included completion plugin for Neovim 

	![](https://img.shields.io/github/stars/Saghen/blink.cmp) ![](https://img.shields.io/github/last-commit/Saghen/blink.cmp) ![](https://img.shields.io/github/commit-activity/y/Saghen/blink.cmp)
- [Wansmer/treesj](https://github.com/Wansmer/treesj) - Neovim plugin for splitting/joining blocks of code

	![](https://img.shields.io/github/stars/Wansmer/treesj) ![](https://img.shields.io/github/last-commit/Wansmer/treesj) ![](https://img.shields.io/github/commit-activity/y/Wansmer/treesj)
- [aklt/plantuml-syntax](https://github.com/aklt/plantuml-syntax) - vim syntax file for plantuml

	![](https://img.shields.io/github/stars/aklt/plantuml-syntax) ![](https://img.shields.io/github/last-commit/aklt/plantuml-syntax) ![](https://img.shields.io/github/commit-activity/y/aklt/plantuml-syntax)
- [andymass/vim-matchup](https://github.com/andymass/vim-matchup) - vim match-up: even better % :facepunch: navigate and highlight matching words :facepunch: modern matchit and matchparen.  Supports both vim and neovim + tree-sitter.

	![](https://img.shields.io/github/stars/andymass/vim-matchup) ![](https://img.shields.io/github/last-commit/andymass/vim-matchup) ![](https://img.shields.io/github/commit-activity/y/andymass/vim-matchup)
- [andythigpen/nvim-coverage](https://github.com/andythigpen/nvim-coverage) - Displays test coverage data in the sign column

	![](https://img.shields.io/github/stars/andythigpen/nvim-coverage) ![](https://img.shields.io/github/last-commit/andythigpen/nvim-coverage) ![](https://img.shields.io/github/commit-activity/y/andythigpen/nvim-coverage)
- [antoinemadec/FixCursorHold.nvim](https://github.com/antoinemadec/FixCursorHold.nvim) - Fix CursorHold Performance.

	![](https://img.shields.io/github/stars/antoinemadec/FixCursorHold.nvim) ![](https://img.shields.io/github/last-commit/antoinemadec/FixCursorHold.nvim) ![](https://img.shields.io/github/commit-activity/y/antoinemadec/FixCursorHold.nvim)
- [brenoprata10/nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) - Highlight colors for neovim

	![](https://img.shields.io/github/stars/brenoprata10/nvim-highlight-colors) ![](https://img.shields.io/github/last-commit/brenoprata10/nvim-highlight-colors) ![](https://img.shields.io/github/commit-activity/y/brenoprata10/nvim-highlight-colors)
- [chrisgrieser/nvim-rip-substitute](https://github.com/chrisgrieser/nvim-rip-substitute) - Search and replace in the current buffer with incremental preview, a convenient UI, and modern regex syntax.

	![](https://img.shields.io/github/stars/chrisgrieser/nvim-rip-substitute) ![](https://img.shields.io/github/last-commit/chrisgrieser/nvim-rip-substitute) ![](https://img.shields.io/github/commit-activity/y/chrisgrieser/nvim-rip-substitute)
- [cljoly/telescope-repo.nvim](https://github.com/cljoly/telescope-repo.nvim) - 🦘 Jump into the repositories (git, mercurial…) of your filesystem with telescope.nvim, without any setup

	![](https://img.shields.io/github/stars/cljoly/telescope-repo.nvim) ![](https://img.shields.io/github/last-commit/cljoly/telescope-repo.nvim) ![](https://img.shields.io/github/commit-activity/y/cljoly/telescope-repo.nvim)
- [cshuaimin/ssr.nvim](https://github.com/cshuaimin/ssr.nvim) - Treesitter based structural search and replace plugin for Neovim.

	![](https://img.shields.io/github/stars/cshuaimin/ssr.nvim) ![](https://img.shields.io/github/last-commit/cshuaimin/ssr.nvim) ![](https://img.shields.io/github/commit-activity/y/cshuaimin/ssr.nvim)
- [danymat/neogen](https://github.com/danymat/neogen) - A better annotation generator. Supports multiple languages and annotation conventions.

	![](https://img.shields.io/github/stars/danymat/neogen) ![](https://img.shields.io/github/last-commit/danymat/neogen) ![](https://img.shields.io/github/commit-activity/y/danymat/neogen)
- [debugloop/telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim) - A telescope extension to view and search your undo tree 🌴

	![](https://img.shields.io/github/stars/debugloop/telescope-undo.nvim) ![](https://img.shields.io/github/last-commit/debugloop/telescope-undo.nvim) ![](https://img.shields.io/github/commit-activity/y/debugloop/telescope-undo.nvim)
- [dmmulroy/ts-error-translator.nvim](https://github.com/dmmulroy/ts-error-translator.nvim)

	![](https://img.shields.io/github/stars/dmmulroy/ts-error-translator.nvim) ![](https://img.shields.io/github/last-commit/dmmulroy/ts-error-translator.nvim) ![](https://img.shields.io/github/commit-activity/y/dmmulroy/ts-error-translator.nvim)
- [echasnovski/mini.cursorword](https://github.com/echasnovski/mini.cursorword) - Neovim Lua plugin for autohighlighting word under cursor. Part of 'mini.nvim' library.

	![](https://img.shields.io/github/stars/echasnovski/mini.cursorword) ![](https://img.shields.io/github/last-commit/echasnovski/mini.cursorword) ![](https://img.shields.io/github/commit-activity/y/echasnovski/mini.cursorword)
- [echasnovski/mini.icons](https://github.com/echasnovski/mini.icons) - Icon provider. Part of 'mini.nvim' library. 

	![](https://img.shields.io/github/stars/echasnovski/mini.icons) ![](https://img.shields.io/github/last-commit/echasnovski/mini.icons) ![](https://img.shields.io/github/commit-activity/y/echasnovski/mini.icons)
- [echasnovski/mini.indentscope](https://github.com/echasnovski/mini.indentscope) - Neovim Lua plugin to visualize and operate on indent scope. Part of 'mini.nvim' library.

	![](https://img.shields.io/github/stars/echasnovski/mini.indentscope) ![](https://img.shields.io/github/last-commit/echasnovski/mini.indentscope) ![](https://img.shields.io/github/commit-activity/y/echasnovski/mini.indentscope)
- [echasnovski/mini.move](https://github.com/echasnovski/mini.move) - Neovim Lua plugin to move any selection in any direction. Part of 'mini.nvim' library. 

	![](https://img.shields.io/github/stars/echasnovski/mini.move) ![](https://img.shields.io/github/last-commit/echasnovski/mini.move) ![](https://img.shields.io/github/commit-activity/y/echasnovski/mini.move)
- [ecthelionvi/NeoColumn.nvim](https://github.com/ecthelionvi/NeoColumn.nvim) - Neovim plugin that highlights individual characters with a toggleable ColorColumn.

	![](https://img.shields.io/github/stars/ecthelionvi/NeoColumn.nvim) ![](https://img.shields.io/github/last-commit/ecthelionvi/NeoColumn.nvim) ![](https://img.shields.io/github/commit-activity/y/ecthelionvi/NeoColumn.nvim)
- [folke/flash.nvim](https://github.com/folke/flash.nvim) - Navigate your code with search labels, enhanced character motions and Treesitter integration

	![](https://img.shields.io/github/stars/folke/flash.nvim) ![](https://img.shields.io/github/last-commit/folke/flash.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/flash.nvim)
- [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim) - Faster LuaLS setup for Neovim

	![](https://img.shields.io/github/stars/folke/lazydev.nvim) ![](https://img.shields.io/github/last-commit/folke/lazydev.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/lazydev.nvim)
- [folke/lsp-colors.nvim](https://github.com/folke/lsp-colors.nvim) - 🌈  Plugin that creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin LSP client.

	![](https://img.shields.io/github/stars/folke/lsp-colors.nvim) ![](https://img.shields.io/github/last-commit/folke/lsp-colors.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/lsp-colors.nvim)
- [folke/noice.nvim](https://github.com/folke/noice.nvim) - 💥 Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.

	![](https://img.shields.io/github/stars/folke/noice.nvim) ![](https://img.shields.io/github/last-commit/folke/noice.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/noice.nvim)
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - ✅  Highlight, list and search todo comments in your projects

	![](https://img.shields.io/github/stars/folke/todo-comments.nvim) ![](https://img.shields.io/github/last-commit/folke/todo-comments.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/todo-comments.nvim)
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - 🏙  A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.

	![](https://img.shields.io/github/stars/folke/tokyonight.nvim) ![](https://img.shields.io/github/last-commit/folke/tokyonight.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/tokyonight.nvim)
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim) - 🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.

	![](https://img.shields.io/github/stars/folke/trouble.nvim) ![](https://img.shields.io/github/last-commit/folke/trouble.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/trouble.nvim)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim) - 💥   Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.

	![](https://img.shields.io/github/stars/folke/which-key.nvim) ![](https://img.shields.io/github/last-commit/folke/which-key.nvim) ![](https://img.shields.io/github/commit-activity/y/folke/which-key.nvim)
- [haydenmeade/neotest-jest](https://github.com/haydenmeade/neotest-jest)

	![](https://img.shields.io/github/stars/haydenmeade/neotest-jest) ![](https://img.shields.io/github/last-commit/haydenmeade/neotest-jest) ![](https://img.shields.io/github/commit-activity/y/haydenmeade/neotest-jest)
- [hedyhli/outline.nvim](https://github.com/hedyhli/outline.nvim) - Navigate code with an outline sidebar. Forked from symbols-outline.nvim. 

	![](https://img.shields.io/github/stars/hedyhli/outline.nvim) ![](https://img.shields.io/github/last-commit/hedyhli/outline.nvim) ![](https://img.shields.io/github/commit-activity/y/hedyhli/outline.nvim)
- [jbyuki/one-small-step-for-vimkind](https://github.com/jbyuki/one-small-step-for-vimkind) - Debug adapter for Neovim plugins

	![](https://img.shields.io/github/stars/jbyuki/one-small-step-for-vimkind) ![](https://img.shields.io/github/last-commit/jbyuki/one-small-step-for-vimkind) ![](https://img.shields.io/github/commit-activity/y/jbyuki/one-small-step-for-vimkind)
- [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) - Plugin for calling lazygit from within neovim.

	![](https://img.shields.io/github/stars/kdheepak/lazygit.nvim) ![](https://img.shields.io/github/last-commit/kdheepak/lazygit.nvim) ![](https://img.shields.io/github/commit-activity/y/kdheepak/lazygit.nvim)
- [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - Not UFO in the sky, but an ultra fold in Neovim.

	![](https://img.shields.io/github/stars/kevinhwang91/nvim-ufo) ![](https://img.shields.io/github/last-commit/kevinhwang91/nvim-ufo) ![](https://img.shields.io/github/commit-activity/y/kevinhwang91/nvim-ufo)
- [kevinhwang91/promise-async](https://github.com/kevinhwang91/promise-async) - Promise & Async in Lua

	![](https://img.shields.io/github/stars/kevinhwang91/promise-async) ![](https://img.shields.io/github/last-commit/kevinhwang91/promise-async) ![](https://img.shields.io/github/commit-activity/y/kevinhwang91/promise-async)
- [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)

	![](https://img.shields.io/github/stars/kyazdani42/nvim-tree.lua) ![](https://img.shields.io/github/last-commit/kyazdani42/nvim-tree.lua) ![](https://img.shields.io/github/commit-activity/y/kyazdani42/nvim-tree.lua)
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

	![](https://img.shields.io/github/stars/kyazdani42/nvim-web-devicons) ![](https://img.shields.io/github/last-commit/kyazdani42/nvim-web-devicons) ![](https://img.shields.io/github/commit-activity/y/kyazdani42/nvim-web-devicons)
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) - Add/change/delete surrounding delimiter pairs with ease. Written with :heart: in Lua.

	![](https://img.shields.io/github/stars/kylechui/nvim-surround) ![](https://img.shields.io/github/last-commit/kylechui/nvim-surround) ![](https://img.shields.io/github/commit-activity/y/kylechui/nvim-surround)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration for buffers

	![](https://img.shields.io/github/stars/lewis6991/gitsigns.nvim) ![](https://img.shields.io/github/last-commit/lewis6991/gitsigns.nvim) ![](https://img.shields.io/github/commit-activity/y/lewis6991/gitsigns.nvim)
- [luozhiya/fittencode.nvim](https://github.com/luozhiya/fittencode.nvim) - Fitten Code AI Programming Assistant for Neovim

	![](https://img.shields.io/github/stars/luozhiya/fittencode.nvim) ![](https://img.shields.io/github/last-commit/luozhiya/fittencode.nvim) ![](https://img.shields.io/github/commit-activity/y/luozhiya/fittencode.nvim)
- [m-demare/hlargs.nvim](https://github.com/m-demare/hlargs.nvim) - Highlight arguments' definitions and usages, using Treesitter

	![](https://img.shields.io/github/stars/m-demare/hlargs.nvim) ![](https://img.shields.io/github/last-commit/m-demare/hlargs.nvim) ![](https://img.shields.io/github/commit-activity/y/m-demare/hlargs.nvim)
- [marilari88/neotest-vitest](https://github.com/marilari88/neotest-vitest) - Vitest adapter for Neovim Neotest plugin

	![](https://img.shields.io/github/stars/marilari88/neotest-vitest) ![](https://img.shields.io/github/last-commit/marilari88/neotest-vitest) ![](https://img.shields.io/github/commit-activity/y/marilari88/neotest-vitest)
- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol client implementation for Neovim

	![](https://img.shields.io/github/stars/mfussenegger/nvim-dap) ![](https://img.shields.io/github/last-commit/mfussenegger/nvim-dap) ![](https://img.shields.io/github/commit-activity/y/mfussenegger/nvim-dap)
- [mollerhoj/telescope-recent-files.nvim](https://github.com/mollerhoj/telescope-recent-files.nvim)

	![](https://img.shields.io/github/stars/mollerhoj/telescope-recent-files.nvim) ![](https://img.shields.io/github/last-commit/mollerhoj/telescope-recent-files.nvim) ![](https://img.shields.io/github/commit-activity/y/mollerhoj/telescope-recent-files.nvim)
- [mxsdev/nvim-dap-vscode-js](https://github.com/mxsdev/nvim-dap-vscode-js) - nvim-dap adapter for vscode-js-debug

	![](https://img.shields.io/github/stars/mxsdev/nvim-dap-vscode-js) ![](https://img.shields.io/github/last-commit/mxsdev/nvim-dap-vscode-js) ![](https://img.shields.io/github/commit-activity/y/mxsdev/nvim-dap-vscode-js)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Quickstart configs for Nvim LSP

	![](https://img.shields.io/github/stars/neovim/nvim-lspconfig) ![](https://img.shields.io/github/last-commit/neovim/nvim-lspconfig) ![](https://img.shields.io/github/commit-activity/y/neovim/nvim-lspconfig)
- [niuiic/blink-cmp-rg.nvim](https://github.com/niuiic/blink-cmp-rg.nvim) - Ripgrep source for blink.nvim

	![](https://img.shields.io/github/stars/niuiic/blink-cmp-rg.nvim) ![](https://img.shields.io/github/last-commit/niuiic/blink-cmp-rg.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/blink-cmp-rg.nvim)
- [niuiic/buffers.nvim](https://github.com/niuiic/buffers.nvim) - Neovim buffer manager.

	![](https://img.shields.io/github/stars/niuiic/buffers.nvim) ![](https://img.shields.io/github/last-commit/niuiic/buffers.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/buffers.nvim)
- [niuiic/code-shot.nvim](https://github.com/niuiic/code-shot.nvim) - Neovim plugin to shot code

	![](https://img.shields.io/github/stars/niuiic/code-shot.nvim) ![](https://img.shields.io/github/last-commit/niuiic/code-shot.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/code-shot.nvim)
- [niuiic/core.nvim](https://github.com/niuiic/core.nvim) - Neovim utils

	![](https://img.shields.io/github/stars/niuiic/core.nvim) ![](https://img.shields.io/github/last-commit/niuiic/core.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/core.nvim)
- [niuiic/dap-utils.nvim](https://github.com/niuiic/dap-utils.nvim) - Better use of nvim-dap

	![](https://img.shields.io/github/stars/niuiic/dap-utils.nvim) ![](https://img.shields.io/github/last-commit/niuiic/dap-utils.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/dap-utils.nvim)
- [niuiic/deps.nvim](https://github.com/niuiic/deps.nvim) - Neovim plugin to manage dependencies.

	![](https://img.shields.io/github/stars/niuiic/deps.nvim) ![](https://img.shields.io/github/last-commit/niuiic/deps.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/deps.nvim)
- [niuiic/divider.nvim](https://github.com/niuiic/divider.nvim) - Divider line for neovim

	![](https://img.shields.io/github/stars/niuiic/divider.nvim) ![](https://img.shields.io/github/last-commit/niuiic/divider.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/divider.nvim)
- [niuiic/format.nvim](https://github.com/niuiic/format.nvim) - An asynchronous, multitasking, and highly configurable formatting plugin.

	![](https://img.shields.io/github/stars/niuiic/format.nvim) ![](https://img.shields.io/github/last-commit/niuiic/format.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/format.nvim)
- [niuiic/git-log.nvim](https://github.com/niuiic/git-log.nvim) - Check git log of the selected code.

	![](https://img.shields.io/github/stars/niuiic/git-log.nvim) ![](https://img.shields.io/github/last-commit/niuiic/git-log.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/git-log.nvim)
- [niuiic/im-switch.nvim](https://github.com/niuiic/im-switch.nvim) - Neovim plugin to automatically switch input method

	![](https://img.shields.io/github/stars/niuiic/im-switch.nvim) ![](https://img.shields.io/github/last-commit/niuiic/im-switch.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/im-switch.nvim)
- [niuiic/lsp-commands.nvim](https://github.com/niuiic/lsp-commands.nvim)

	![](https://img.shields.io/github/stars/niuiic/lsp-commands.nvim) ![](https://img.shields.io/github/last-commit/niuiic/lsp-commands.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/lsp-commands.nvim)
- [niuiic/multiple-session.nvim](https://github.com/niuiic/multiple-session.nvim) - Session manager for neovim

	![](https://img.shields.io/github/stars/niuiic/multiple-session.nvim) ![](https://img.shields.io/github/last-commit/niuiic/multiple-session.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/multiple-session.nvim)
- [niuiic/omega.nvim](https://github.com/niuiic/omega.nvim) - Neovim lua utils

	![](https://img.shields.io/github/stars/niuiic/omega.nvim) ![](https://img.shields.io/github/last-commit/niuiic/omega.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/omega.nvim)
- [niuiic/part-edit.nvim](https://github.com/niuiic/part-edit.nvim) - Edit a part of a file individually

	![](https://img.shields.io/github/stars/niuiic/part-edit.nvim) ![](https://img.shields.io/github/last-commit/niuiic/part-edit.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/part-edit.nvim)
- [niuiic/quickfix.nvim](https://github.com/niuiic/quickfix.nvim) - Neovim plugin providing extended functionality for quickfix.

	![](https://img.shields.io/github/stars/niuiic/quickfix.nvim) ![](https://img.shields.io/github/last-commit/niuiic/quickfix.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/quickfix.nvim)
- [niuiic/remote.nvim](https://github.com/niuiic/remote.nvim) - Edit remote files locally.

	![](https://img.shields.io/github/stars/niuiic/remote.nvim) ![](https://img.shields.io/github/last-commit/niuiic/remote.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/remote.nvim)
- [niuiic/task.nvim](https://github.com/niuiic/task.nvim) - Task manager for neovim.

	![](https://img.shields.io/github/stars/niuiic/task.nvim) ![](https://img.shields.io/github/last-commit/niuiic/task.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/task.nvim)
- [niuiic/terminal.nvim](https://github.com/niuiic/terminal.nvim) - Simple and highly configurable terminal plugin for neovim.

	![](https://img.shields.io/github/stars/niuiic/terminal.nvim) ![](https://img.shields.io/github/last-commit/niuiic/terminal.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/terminal.nvim)
- [niuiic/track.nvim](https://github.com/niuiic/track.nvim) - Neovim plugin to track the thought process of reading source code.

	![](https://img.shields.io/github/stars/niuiic/track.nvim) ![](https://img.shields.io/github/last-commit/niuiic/track.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/track.nvim)
- [niuiic/translate.nvim](https://github.com/niuiic/translate.nvim) - Highly configurable translation plugin for neovim.

	![](https://img.shields.io/github/stars/niuiic/translate.nvim) ![](https://img.shields.io/github/last-commit/niuiic/translate.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/translate.nvim)
- [niuiic/window.nvim](https://github.com/niuiic/window.nvim)

	![](https://img.shields.io/github/stars/niuiic/window.nvim) ![](https://img.shields.io/github/last-commit/niuiic/window.nvim) ![](https://img.shields.io/github/commit-activity/y/niuiic/window.nvim)
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.

	![](https://img.shields.io/github/stars/nvim-lua/plenary.nvim) ![](https://img.shields.io/github/last-commit/nvim-lua/plenary.nvim) ![](https://img.shields.io/github/commit-activity/y/nvim-lua/plenary.nvim)
- [nvim-neotest/neotest-python](https://github.com/nvim-neotest/neotest-python)

	![](https://img.shields.io/github/stars/nvim-neotest/neotest-python) ![](https://img.shields.io/github/last-commit/nvim-neotest/neotest-python) ![](https://img.shields.io/github/commit-activity/y/nvim-neotest/neotest-python)
- [nvim-neotest/neotest](https://github.com/nvim-neotest/neotest) - An extensible framework for interacting with tests within NeoVim.

	![](https://img.shields.io/github/stars/nvim-neotest/neotest) ![](https://img.shields.io/github/last-commit/nvim-neotest/neotest) ![](https://img.shields.io/github/commit-activity/y/nvim-neotest/neotest)
- [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio) - A library for asynchronous IO in Neovim

	![](https://img.shields.io/github/stars/nvim-neotest/nvim-nio) ![](https://img.shields.io/github/last-commit/nvim-neotest/nvim-nio) ![](https://img.shields.io/github/commit-activity/y/nvim-neotest/nvim-nio)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Find, Filter, Preview, Pick. All lua, all the time.

	![](https://img.shields.io/github/stars/nvim-telescope/telescope.nvim) ![](https://img.shields.io/github/last-commit/nvim-telescope/telescope.nvim) ![](https://img.shields.io/github/commit-activity/y/nvim-telescope/telescope.nvim)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Nvim Treesitter configurations and abstraction layer

	![](https://img.shields.io/github/stars/nvim-treesitter/nvim-treesitter) ![](https://img.shields.io/github/last-commit/nvim-treesitter/nvim-treesitter) ![](https://img.shields.io/github/commit-activity/y/nvim-treesitter/nvim-treesitter)
- [ofirgall/goto-breakpoints.nvim](https://github.com/ofirgall/goto-breakpoints.nvim) - Cycle between breakpoints with keymappings for nvim-dap

	![](https://img.shields.io/github/stars/ofirgall/goto-breakpoints.nvim) ![](https://img.shields.io/github/last-commit/ofirgall/goto-breakpoints.nvim) ![](https://img.shields.io/github/commit-activity/y/ofirgall/goto-breakpoints.nvim)
- [rachartier/tiny-code-action.nvim](https://github.com/rachartier/tiny-code-action.nvim) - A Neovim plugin that provides a simple way to run and visualize code actions with Telescope.

	![](https://img.shields.io/github/stars/rachartier/tiny-code-action.nvim) ![](https://img.shields.io/github/last-commit/rachartier/tiny-code-action.nvim) ![](https://img.shields.io/github/commit-activity/y/rachartier/tiny-code-action.nvim)
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Set of preconfigured snippets for different languages. 

	![](https://img.shields.io/github/stars/rafamadriz/friendly-snippets) ![](https://img.shields.io/github/last-commit/rafamadriz/friendly-snippets) ![](https://img.shields.io/github/commit-activity/y/rafamadriz/friendly-snippets)
- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - A UI for nvim-dap

	![](https://img.shields.io/github/stars/rcarriga/nvim-dap-ui) ![](https://img.shields.io/github/last-commit/rcarriga/nvim-dap-ui) ![](https://img.shields.io/github/commit-activity/y/rcarriga/nvim-dap-ui)
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) - A fancy, configurable, notification manager for NeoVim

	![](https://img.shields.io/github/stars/rcarriga/nvim-notify) ![](https://img.shields.io/github/last-commit/rcarriga/nvim-notify) ![](https://img.shields.io/github/commit-activity/y/rcarriga/nvim-notify)
- [rktjmp/highlight-current-n.nvim](https://github.com/rktjmp/highlight-current-n.nvim) - Highlights the current /, ? or * match under your cursor when pressing n or N and gets out of the way afterwards.

	![](https://img.shields.io/github/stars/rktjmp/highlight-current-n.nvim) ![](https://img.shields.io/github/last-commit/rktjmp/highlight-current-n.nvim) ![](https://img.shields.io/github/commit-activity/y/rktjmp/highlight-current-n.nvim)
- [rouge8/neotest-rust](https://github.com/rouge8/neotest-rust) - Neotest adapter for Rust, using cargo-nextest.

	![](https://img.shields.io/github/stars/rouge8/neotest-rust) ![](https://img.shields.io/github/last-commit/rouge8/neotest-rust) ![](https://img.shields.io/github/commit-activity/y/rouge8/neotest-rust)
- [s1n7ax/nvim-window-picker](https://github.com/s1n7ax/nvim-window-picker) - This plugins prompts the user to pick a window and returns the window id of the picked window

	![](https://img.shields.io/github/stars/s1n7ax/nvim-window-picker) ![](https://img.shields.io/github/last-commit/s1n7ax/nvim-window-picker) ![](https://img.shields.io/github/commit-activity/y/s1n7ax/nvim-window-picker)
- [sontungexpt/url-open](https://github.com/sontungexpt/url-open) - Minimal plugin allow you to open url under cursor in neovim without netrw with default browser of your system and highlight url

	![](https://img.shields.io/github/stars/sontungexpt/url-open) ![](https://img.shields.io/github/last-commit/sontungexpt/url-open) ![](https://img.shields.io/github/commit-activity/y/sontungexpt/url-open)
- [sphamba/smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim) - 🌠 Neovim plugin to animate the cursor with a smear effect in all terminals

	![](https://img.shields.io/github/stars/sphamba/smear-cursor.nvim) ![](https://img.shields.io/github/last-commit/sphamba/smear-cursor.nvim) ![](https://img.shields.io/github/commit-activity/y/sphamba/smear-cursor.nvim)
- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) - Neovim plugin to improve the default vim.ui interfaces

	![](https://img.shields.io/github/stars/stevearc/dressing.nvim) ![](https://img.shields.io/github/last-commit/stevearc/dressing.nvim) ![](https://img.shields.io/github/commit-activity/y/stevearc/dressing.nvim)
- [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)

	![](https://img.shields.io/github/stars/theHamsta/nvim-dap-virtual-text) ![](https://img.shields.io/github/last-commit/theHamsta/nvim-dap-virtual-text) ![](https://img.shields.io/github/commit-activity/y/theHamsta/nvim-dap-virtual-text)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)

	![](https://img.shields.io/github/stars/williamboman/mason.nvim) ![](https://img.shields.io/github/last-commit/williamboman/mason.nvim) ![](https://img.shields.io/github/commit-activity/y/williamboman/mason.nvim)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - autopairs for neovim written in lua

	![](https://img.shields.io/github/stars/windwp/nvim-autopairs) ![](https://img.shields.io/github/last-commit/windwp/nvim-autopairs) ![](https://img.shields.io/github/commit-activity/y/windwp/nvim-autopairs)
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Use treesitter to auto close and auto rename html tag

	![](https://img.shields.io/github/stars/windwp/nvim-ts-autotag) ![](https://img.shields.io/github/last-commit/windwp/nvim-ts-autotag) ![](https://img.shields.io/github/commit-activity/y/windwp/nvim-ts-autotag)
- [xzbdmw/colorful-menu.nvim](https://github.com/xzbdmw/colorful-menu.nvim) - Bring enjoyment to your auto completion.

	![](https://img.shields.io/github/stars/xzbdmw/colorful-menu.nvim) ![](https://img.shields.io/github/last-commit/xzbdmw/colorful-menu.nvim) ![](https://img.shields.io/github/commit-activity/y/xzbdmw/colorful-menu.nvim)
- [yioneko/nvim-vtsls](https://github.com/yioneko/nvim-vtsls)

	![](https://img.shields.io/github/stars/yioneko/nvim-vtsls) ![](https://img.shields.io/github/last-commit/yioneko/nvim-vtsls) ![](https://img.shields.io/github/commit-activity/y/yioneko/nvim-vtsls)
