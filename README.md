# 💤 My Neovim Configuration

This is my personal Neovim configuration built with **Lua** and managed using the [Lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager. It focuses on speed, simplicity, and developer productivity.

## ✨ Features

- 📦 Plugin management using **Lazy.nvim**
- 🚀 Fast startup time with lazy loading
- 🧠 LSP support via **nvim-lspconfig**
- 🧪 Auto-completion with **nvim-cmp**
- 🎨 Aesthetic and minimal UI with icons, statusline, and color scheme
- 📝 Treesitter-based syntax highlighting and code folding
- 🔄 File and buffer navigation with **Telescope**
- 📁 File explorer with **nvim-tree**
- 🔧 Useful key mappings and commands for efficiency

## 📁 Folder Structure

```text
config-nvim/
├── init.lua          # Main config entrypoint
├── lua/
│   ├── plugins/      # Plugin specs loaded via lazy.nvim
│   ├── core/         # Editor settings, keymaps, and autocmds
│   └── ...           # Any additional modules
├── lazy-lock.json    # Lockfile for plugin versions
└── ...
```

## 🚀 Getting Started

### Prerequisites

- [Neovim 0.9+](https://neovim.io/)
- [git](https://git-scm.com/)
- [nerd fonts](https://www.nerdfonts.com/) (for icon support)

### Installation

```bash
git clone https://github.com/aditya-chaphekar/config-nvim.git ~/.config/nvim
nvim
```

The plugins will install automatically on first launch via `lazy.nvim`.

## 🔧 Customization

Feel free to tweak the configs under `lua/core/` or add new plugins in `lua/plugins/`. This config is modular and easy to extend.


## 📄 License

MIT License. Feel free to copy, modify, and use it for your own dotfiles.

