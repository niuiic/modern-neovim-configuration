# Modern Neovim Configuration

Neovim + Linux = Your Best Almighty IDE

> This configuration is for linux only, and it's not highly optimized for startup performance.

## Supported Language List

- Rust
- Go
- Ts/Js
- C/C++
- Python
- Shell
- SQL
- Lua
- SystemVerilog

> Common features: lsp、format、autocompletion(custom snippets and source)、debug.

> Not all features has been implemented, but you can easily implement most functions needed.

## Personal Environment

OS: Gentoo

WM: Sway (use vulkan renderer)

Terminal: Alacritty (a GPU-accelerated terminal emulator)

Neovim: V0.8+ (build from source with LuaJIT only)

## QuickStart

> It's not recommended to copy the entire configuration directly. You need your own configuration and shortcuts. It's better to find the plugins you are interested in and refer to their configuration.

1. Install `packer.nvim`

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2. Install `nodejs`, `go`, `rust` for `mason.nvim` and `nvim-treesitter`. If you want to use `fcitx.nvim`, install `fcitx5` first, or you need to remove this plugin from `lua/plugins.lua`.

3. `git clone https://github.com/niuiic/modern-neovim-configuration ~/.config/nvim`

4. `cd ~/.config/nvim && mv init.lua init.luabp`, then create a new `init.lua`.

```lua
require('packer').startup({
    function(use)
        use("wbthomason/packer.nvim")
        use("folke/which-key.nvim")
    end
})
```

5. Use `:PackerSync` to install `which-key.nvim`.

6. Modify `init.lua`.

```lua
require("plugins")
```

7. Use `:PackerSync` to install remaining plugins.

8. `mv init.luabp init.lua`.

9. Install lsps, formatters, lints, daps with `mason.nvim`. Check `lua/plugin/mason.lua` for details.

10. Use `:checkhealth` to check if something is missing.

11. Look for specific functions in `lua/plugins.lua`.

## Keymap

`which-key.nvim` will tell you. You can also check `lua/plugin/*` and `lua/keymap.lua` for details.

> leader: `\`

> localLeader: `<space>`

## LSP

Create a `lspname.lua` in `lua/lsp`, edit the file in the same way as other files.

Modify the `lspList` in `lua/lsp/init.lua`.

> You can install most of the lsps with `mason.nvim`.

## Formatter

Check formatter setting in `lua/plugin/null-ls.lua`. Look for more formatters on [null-ls buildin formatters](https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting).

## DAP

Create a `dapname.lua` in `lua/debugger`, edit the file in the same way as other files.

Modify the `debuggerList` in `lua/debugger/init.lua`.

> You can install most of the daps with `mason.nvim`.

## Custom Snippets and Sources

Create a `filetype.lua` in `lua/snippet` or `lua/source`, edit the file in the same way as other files.

Modify the `langList` in `lua/snippet/init.lua` or `lua/source/init.lua`.

> [Snippet examples](https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua) and [snippet document](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md) may help you.

## Known Issues

- `<C-o>` may not return to correct position.
- Some completion sources and the status line plugin may crash for unknown reasons.

## Screenshot

### Full Screen

![Full Screen](./img/full-screen.png)

### Status Line

![Status Line](./img/statusline.png)

### Buffer Line

![Buffer Line](./img/bufferline.png)

### Diagnostic

![Diagnostic](./img/diagnostic.png)

### Fuzzy Finder

Search files, tags, buffers, history files, marks, projects, git status, etc.

![Fuzzy Finder](./img/fuzzy-finder.png)

### AutoComplete CMD

![AutoComplete CMD](./img/autocomplete-cmd.png)

### Rename

![Rename](./img/rename.png)

### Go to Reference

![Go to Reference](./img/goto-reference.png)

### Keymap Suggestion

![Keymap Suggestion](./img/keymap-suggestion.png)

### Code AutoComplete

![Code AutoComplete](./img/code-autocomplete.png)

### Inner Terminal

![Inner Terminal](./img/inner-terminal.png)

### Todo Comments

![Todo Comments](./img/todo-comments.png)

### File Tree

![File Tree](./img/file-tree.png)

### Undo Tree

![Undo Tree](./img/undo-tree.png)

### Dashboard

![Dashboard](./img/dashboard.png)

### Translate

![Translate](./img/translate.png)

### Unit Test

![Unit Test](./img/unit-test.png)

### Async Tasks

![Async Tasks](./img/async-tasks.png)

### Indentation Guides

![Indentation Guides](./img/indentation-guides.png)

### Yank History

![Yank History](./img/yank-history.png)

### Code Action

![Code Action](./img/code-action.png)

### Colorful Brackets

![Colorful Brackets](./img/colorful-brackets.png)

### Debug

![Debug](./img/debug.png)

### View Git Diff

![View Git Diff](./img/view-git-diff.png)

### Git Signs

![Git Signs](./img/git-signs.png)

### Document

![Document](./img/document.png)

### Sql

![Sql](./img/sql.png)

### Quick Motion

![Quick Motion](./img/quick-motion.png)

### Expand Expression

![Expand Expression](./img/expand-expression.png)

### TagBar

![TagBar](./img/tagbar.png)

### Lsp Progress

![Lsp Progress](./img/lsp-progress.png)

### Code Context

![Code Context](./img/code-context.png)

### Fold

![Fold](./img/fold.png)

### Colorizer

![Colorizer](./img/colorizer.png)

### Session

![Session](./img/session.png)

### Quickfix

![Quickfix](./img/quickfix.png)

### Startup Time

![Startup Time](./img/startup-time.png)

### Run Code Snip

![Run Code Snip](./img/run-code-snip.png)

### Lazygit

![Lazygit](./img/laygit.png)

### Git Conflict

![Git Conflict](./img/git-conflict.png)
