# Modern Neovim Configuration

Neovim + Linux = Best Almighty IDE

> This configuration is for linux only.

## Mainly Supported Language(or Framework) List

- Rust
- Javascript/Typescript
- Shell
- SQL
- Lua
- GLSL
- WGSL
- Vue
- React

> Common features: lsp、format、autocompletion (including custom snippets and source)、debug.

## Personal Environment

OS: Gentoo

Terminal: Alacritty

Neovim: V0.10+

## Dependencies

1. `nodejs`, `go`, `rust` (required for `mason.nvim` and `nvim-treesitter`). Use `:h mason-requirements` to check more dependencies.
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

### Custom Snippets and Sources

Create `filetype.lua` in `lua/snippet` or `lua/source`.

Update `lang_list` in `lua/snippet/init.lua` or `lua/source/init.lua`.

> [Snippet examples](https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua) and [snippet document](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md) may help you.

### Config for Workspace

The root path of a workspace is where `.git` located. `$rootPath/.nvim/init.lua` is the entry of the local configuration.

### Tasks

[overseer.nvim](https://github.com/stevearc/overseer.nvim) is the default task manager. Here is the recommended way to define tasks.

1. Create `.nvim/task/` in the root path of the project.
2. Add tasks to `.nvim/task/task.sh` and `.nvim/task/init.lua`.

`.nvim/task/init.lua`

```lua
local core = require("core")

local overseer = require("overseer")

local scriptPath = core.file.root_path() .. "/.nvim/task/task.sh"

overseer.register_template({
	name = "checkTs",
	builder = function()
		return {
			cmd = { scriptPath },
			args = { "checkTs" },
			components = { "on_output_quickfix", "default", "on_complete_notify" },
		}
	end,
})

overseer.register_template({
	name = "lint",
	builder = function()
		return {
			cmd = { scriptPath },
			args = { "lint" },
			components = {
				"on_output_quickfix",
				"default",
				"on_complete_notify",
			},
		}
	end,
})
```

`.nvim/task/task.sh`

```sh
set -eE

if [ "$1" = "checkTs" ]; then
	pnpm vue-tsc --noEmit
elif [ "$1" = "lint" ]; then
	pnpm lint:eslint --rule "no-console: error" -f unix
	pnpm lint:stylelint -f unix
fi
```

3. `chmod +x .nvim/task/task.sh`
4. Import `.nvim/task/init.lua` in `.nvim/init.lua`.

`.nvim/init.lua`

```lua
require("task")
```

> These tasks must be able to be terminated automatically.

# Showcase

Some functions are not convenient to display with pictures, please check `lua/plugins.lua`.

<details>
  <summary><b>Full Screen</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/full-screen.png"/>
</details>

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
  <summary><b>Yank History</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/yank-history.png"/>
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
  <summary><b>Sql</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/sql.png"/>
</details>

<details>
  <summary><b>Quick Motion</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/quick-motion.png"/>
</details>

<details>
  <summary><b>TagBar</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/tagbar.png"/>
</details>

<details>
  <summary><b>Lsp Progress</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/lsp-progress.png"/>
</details>

<details>
  <summary><b>Symbol Winbar</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/symbol-winbar.png"/>
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
  <summary><b>Git Conflict</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/git-conflict.png"/>
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

<details>
  <summary><b>Github Action</b></summary>
<img src="https://github.com/niuiic/assets/blob/main/modern-neovim-configuration/github-action.png"/>
</details>
