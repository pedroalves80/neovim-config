# AGENTS.md - Neovim Configuration Guidelines

## Project Overview

This is Pedro Alves' opinionated Neovim configuration written in **Lua**, using **Lazy.nvim** for plugin management. The codebase focuses on clean, maintainable Lua code organized by concern (plugins, options, keymaps, autocommands).

---

## Build, Lint & Test

### Testing

**No automated test suite exists.** Testing is manual via:

```bash
# Start Neovim with this config
nvim

# Check health diagnostics
:checkhealth

# Run Lazy.nvim diagnostics
:Lazy
```

### Linting & Formatting

**Linter**: [StyLua](https://github.com/JohnnyMorganz/StyLua) (Lua formatter)

```bash
# Format all Lua files (via conform.nvim inside Neovim)
# Inside Neovim: <leader>fm

# Or manually format via CLI:
stylua lua/
```

**StyLua config** (`.stylua.toml`):
- Column width: 160
- Indent: 2 spaces
- Quote style: AutoPreferSingle (prefers single quotes)
- Line endings: Unix

### No explicit build step

The config uses Lazy.nvim, which auto-installs and manages plugins. No compilation needed.

---

## Code Style Guidelines

### Imports & Requires

- Use `require()` for Lua module imports, always at the top of files
- Prefer local variables to avoid polluting the global namespace

```lua
-- Good
local conform = require 'conform'
local fn = vim.fn

-- Avoid
_G.my_var = value  -- global pollution
```

### Formatting & Whitespace

- **2 spaces** for indentation (never tabs)
- **160 character** line width limit
- **Single quotes** preferred over double quotes
- **Unix line endings** (LF, not CRLF)
- No trailing whitespace
- Blank lines between logical sections

```lua
-- Good
local function setup_keymap()
  vim.keymap.set('n', '<leader>fm', function()
    require('conform').format { async = true }
  end, { desc = '[F]ormat buffer' })
end

-- Avoid - double quotes, inconsistent spacing
local function setupKeymap() 
  vim.keymap.set("n","<leader>fm",function()
  end,{"desc":"Format"})
end
```

### Type Annotations & Diagnostics

- Use `---@type` and function annotations for LSP support
- Use `---@diagnostic disable-next-line:` sparingly, with justification

```lua
-- Good - inline diagnostic directive with comment
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Good - type annotation
---@type table<string, any>
local config = {}

-- Avoid - suppressing without reason
---@diagnostic disable: undefined-global
```

### Naming Conventions

- **snake_case** for variables, functions, and modules: `local_var`, `my_function`, `plugin_config`
- **PascalCase** for class-like constructors (rarely used in config)
- **UPPER_SNAKE_CASE** for constants: `MAX_RETRIES`, `DEBUG_MODE`
- **Descriptive names**: `setup_lsp()` not `s()` or `setup()`

```lua
-- Good
local max_retries = 3
local function setup_keymaps() end
local plugin_config = { name = 'example' }

-- Avoid
local mr = 3
local function s() end
local pc = {}
```

### Error Handling

- Use `error()` for unrecoverable errors with descriptive messages
- Use `vim.notify()` with severity levels for user-facing warnings
- Check return values from external calls (git, formatters, etc.)

```lua
-- Good - informative error message
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  error('Error cloning lazy.nvim:\n' .. out)
end

-- Good - user notification with level
vim.notify('Format failed: ' .. err, vim.log.levels.WARN)

-- Good - check for errors
local out = vim.fn.system { 'git', 'clone', ... }
if vim.v.shell_error ~= 0 then
  error('Git command failed: ' .. out)
end
```

### Comments & Documentation

- Use `--` for single-line comments
- Use `--[[` for multi-line comments
- Document public functions and non-obvious logic
- Keep comments concise and up-to-date

```lua
-- Good
-- Exit terminal mode with ESC (easier than default <C-\><C-n>)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Good - document why
if disable_filetypes[vim.bo[bufnr].filetype] then
  lsp_format_opt = 'never'  -- C/C++ have conflicting formatters
else
  lsp_format_opt = 'fallback'
end
```

### Plugin Configuration Pattern

All plugin configs follow Lazy.nvim's spec:

```lua
return {
  'plugin/name',
  event = { 'BufWritePre' },     -- lazy-load event
  cmd = { 'PluginCommand' },     -- lazy-load command
  keys = { ... },                 -- lazy-load keybinding
  opts = { ... },                 -- plugin options
  config = function(plugin, opts) -- custom setup
    -- configuration here
  end,
}
```

### Organization

- **Entry point**: `init.lua` (require-only, delegate to modules)
- **Modules**: `lua/options.lua`, `lua/keymaps.lua`, `lua/autocommands.lua`
- **Plugins**: `lua/plugins/` (one file per plugin or feature)
- **File size**: Keep modules <200 lines; break into separate files if larger

```lua
-- Good: init.lua (delegation only)
require 'options'
require 'keymaps'
require 'autocommands'
require 'plugin-manager'

-- Good: lua/keymaps.lua (focused, <200 lines)
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '...' })
```

---

## Git & Contributing

- Commit messages: descriptive, present tense ("Add XYZ" not "Added XYZ")
- One logical change per commit
- Run `stylua lua/` before committing
- Test via `:checkhealth` and manual verification

---

## Common Tasks

| Task                      | Command                     |
| ------------------------- | --------------------------- |
| Start Neovim              | `nvim`                      |
| Format all Lua            | `stylua lua/`               |
| Check health              | `:checkhealth`              |
| Sync/update plugins       | `:Lazy sync`                |
| View plugin list          | `:Lazy` (inside Neovim)     |
| Format current buffer     | `<leader>fm` (in Neovim)    |

---

## Key Directories

- `lua/` — all Lua modules and configs
- `lua/plugins/` — individual plugin configurations
- `doc/` — documentation files
- `.github/` — issue templates and PR templates
