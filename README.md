# Pedro Alves’ Neovim Configuration 🌟

Opinionated and streamlined Neovim setup built in Lua with plugin management via [Lazy.nvim](https://github.com/folke/lazy.nvim), tailored for efficient workflows across web, Python, C++, Markdown, LaTeX, and more.

---

## 🚀 Features

- **Plugin Management**: Lazy.nvim for fast, on-demand loading
- **Completion & LSP**: `nvim-cmp`, `nvim-lspconfig`, `mason.nvim`
- **Syntax & Parsing**: `nvim-treesitter`
- **Fuzzy Finding**: `telescope.nvim`
- **File Explorer**: `nvim-tree.lua`
- **Git Integration**: `vim-fugitive`, `gitsigns.nvim`
- **Pairs & Pasting**: `nvim-autopairs`, `vim-sandwich`, `better-escape.nvim`
- **Statusline & Icons**: `lualine.nvim`, `nvim-web-devicons`
- **Snippets**: `LuaSnip`
- **Commenting**: `vim-commentary`
- **Notifications**: `nvim-notify`
- **Folding**: `nvim-ufo`, `statuscol.nvim`
- **LaTeX & Markdown**: `vimtex`, `markdown-preview.nvim`
- **Code Runner**: Asynchronous build/compile commands
- **Plus**: Undo tree, search lens, hop, quickfix improvements & more

---

## ⚙️ Installation

```bash
git clone https://github.com/pedroalves80/neovim-config.git ~/.config/nvim
nvim  # Lazy.nvim will auto-install everything
```

---

## 🛠️ Setup & Usage

1. Install Neovim 0.8+
2. Make sure `git`, `ripgrep`, and `fd` are installed
3. Open Neovim and run `:Lazy sync`
4. Restart Neovim after plugin sync
5. Use `:checkhealth` for diagnostics

---

## 🗂️ Project Structure

```
~/.config/nvim/
├── init.lua              # Entry point & Lazy.nvim bootstrap
└── lua/
    ├── options.lua       # Editor settings
    ├── mappings.lua      # Keybindings
    ├── plugins/
    │   ├── init.lua      # Plugin list
    │   └── configs/      # Plugin-specific configs
    ├── autocommands.lua
    └── custom.lua        # Personal overrides & additions
```

---

## ⌨️ Keybindings

| Shortcut          | Mode   | Action                |
| ----------------- | ------ | --------------------- |
| `jk`              | Insert | Escape                |
| `<leader>ff`      | Normal | Find file (Telescope) |
| `<leader>fg`      | Normal | Live grep             |
| `<leader>fh`      | Normal | Help search           |
| `<leader>fb`      | Normal | List buffers          |
| `<leader>nr`      | Normal | Refresh file explorer |
| `<leader>gs`      | Normal | Git status            |
| `<leader>gc`      | Normal | Git commit            |
| `<leader><Space>` | Normal | Trim whitespace       |
| `<F9>`            | Normal | Compile/run code      |

Check `lua/mappings.lua` for the full list!

---

## 🧩 Customization

Use `lua/custom.lua` (or create your own module under `/custom/`) to:

- Add or remove plugins
- Modify LSP/server settings
- Define new keymaps or autocommands

---

## 📚 Contributing & Help

- Found a bug or have an idea? Open an issue or PR
- Use `:checkhealth` to debug LSP or runtime issues
- All contributions are welcome 🙌

---

## 📖 Credits & Resources

- Plugin manager: [Lazy.nvim](https://github.com/folke/lazy.nvim)
- Inspiration: [jdhao/nvim-config](https://github.com/jdhao/nvim-config), [ntk148v/neovim-config](https://github.com/ntk148v/neovim-config)

---

## 🏷️ License

MIT © Pedro Alves
