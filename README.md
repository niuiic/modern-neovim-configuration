# Modern Neovim Configuration

Modern configuration for neovim.

> It's not highly optimized for startup performance.

## QuickStart

1. install packer.nvim

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2. `mv init.lua init.luabp`, then create a new `init.lua`.

```lua
vim.cmd [[packadd packer.nvim]]
require('packer').startup({
    function(use)
        use 'liuchengxu/vim-which-key'
    end
})
```

3. use `:PackerSync` to install `vim-which-key`.

4. `mv init.luabp init.lua`

5. use `:PackerSync` to install remaining plugins.

6. use `:checkhealth` to check if something is missing.

7. Look for specific functions in `lua/plugins.lua`.

> It's not recommended to copy the entire configuration directly. You need your own configuration and shortcuts. It's better to find the plugins you are interested in and refer to their configuration.

## Environment

OS: Gentoo

WM: Sway (use vulkan renderer)

Terminal: Alacritty (a GPU-accelerated terminal emulator)

Neovim: V0.8+ (build from source with LuaJIT only)

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

Search files in workspace, tags, buffers, history files, marks, projects, quickfix, git status, etc.

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

### Starter

![Starter](./img/starter.png)

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
