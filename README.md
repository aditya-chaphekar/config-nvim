# Neovim Configuration

A modern, feature-rich Neovim configuration built with Lazy.nvim plugin manager, focused on developer productivity and ease of use.

## 🚀 Features

- **Plugin Management**: Lazy.nvim for fast and efficient plugin loading
- **Language Support**: Built-in LSP support for 9+ programming languages
- **Auto-completion**: Intelligent code completion with nvim-cmp
- **File Explorer**: nvim-tree for intuitive file navigation
- **Fuzzy Finding**: Telescope for blazing-fast file and content searching
- **Git Integration**: Gitsigns for seamless Git workflow
- **Syntax Highlighting**: Treesitter for advanced syntax highlighting
- **Code Formatting**: Auto-formatting on save with Prettier and LSP
- **Theme**: OneDark Pro theme for a beautiful coding experience
- **Status Line**: Informative Lualine status bar
- **File Navigation**: Harpoon for quick file jumping
- **Todo Management**: Todo-comments for tracking TODO/FIXME/etc.
- **Package Management**: Real-time npm package version information

## 📋 Prerequisites

Before installing this configuration, ensure you have the following:

1. **Neovim** (>= 0.9.0)
   ```bash
   # Ubuntu/Debian
   sudo apt install neovim
   
   # Arch Linux
   sudo pacman -S neovim
   
   # macOS
   brew install neovim
   ```

2. **Git** (for plugin management)
   ```bash
   # Ubuntu/Debian
   sudo apt install git
   
   # Arch Linux
   sudo pacman -S git
   
   # macOS
   brew install git
   ```

3. **Node.js and npm** (for LSP servers and formatters)
   ```bash
   # Ubuntu/Debian
   curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
   sudo apt-get install -y nodejs
   
   # Arch Linux
   sudo pacman -S nodejs npm
   
   # macOS
   brew install node
   ```

4. **Ripgrep** (for Telescope live_grep)
   ```bash
   # Ubuntu/Debian
   sudo apt install ripgrep
   
   # Arch Linux
   sudo pacman -S ripgrep
   
   # macOS
   brew install ripgrep
   ```

5. **wl-clipboard** (for system clipboard support on Wayland)
   ```bash
   # Ubuntu/Debian
   sudo apt install wl-clipboard
   
   # Arch Linux
   sudo pacman -S wl-clipboard
   ```

6. **Python** (for Python LSP support)
   ```bash
   # Ubuntu/Debian
   sudo apt install python3 python3-pip
   
   # Arch Linux
   sudo pacman -S python python-pip
   
   # macOS
   brew install python
   ```

## 🛠️ Installation

1. **Backup existing Neovim configuration** (if you have one):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone https://github.com/aditya-chaphekar/config-nvim.git ~/.config/nvim
   cd ~/.config/nvim
   git checkout v3
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```

4. **Wait for plugins to install**: Lazy.nvim will automatically download and install all plugins on first launch.

5. **Install LSP servers**: Open Neovim and run:
   ```vim
   :Mason
   ```
   All required LSP servers and tools will be automatically installed.

## 🎯 Language Server Protocol (LSP) Support

This configuration provides out-of-the-box LSP support for:

| Language | LSP Server | Auto-installed |
|----------|------------|----------------|
| **Lua** | lua_ls | ✅ |
| **Go** | gopls | ✅ |
| **Rust** | rust_analyzer | ✅ |
| **Python** | pyright | ✅ |
| **Java** | jdtls | ✅ |
| **Bash** | bashls | ✅ |
| **HTML** | html | ✅ |
| **TypeScript/JavaScript** | ts_ls | ✅ |
| **TailwindCSS** | tailwindcss | ✅ |

### Additional Tools

- **Prettier**: JavaScript/TypeScript/CSS/HTML/JSON formatter
- **ESLint**: JavaScript/TypeScript linter and code actions

## ⌨️ Key Mappings

### Leader Key
- **Leader**: `<Space>`

### Core Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>e` | Toggle file explorer | Open/close nvim-tree |
| `<leader>ff` | Find files | Telescope file finder |
| `<leader>fg` | Live grep | Search text in files |
| `<leader>fb` | Buffer search | Find in current buffer |
| `<leader>fr` | Find & replace | Replace word under cursor |

### LSP (when available)
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Go to definition | Jump to symbol definition |
| `K` | Hover documentation | Show symbol documentation |
| `<leader>ca` | Code actions | Show available code actions |
| `<leader>rn` | Rename symbol | Rename symbol across project |

### Git Integration
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>gs` | Toggle git signs | Show/hide git diff markers |
| `<leader>gb` | Toggle git blame | Show/hide git blame inline |
| `<leader>gd` | Git diff | Show git diff for current file |
| `<leader>gp` | Preview hunk | Preview git hunk changes |

### Harpoon (Quick File Navigation)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>a` | Add to harpoon | Add current file to harpoon |
| `<C-e>` | Harpoon menu | Open harpoon quick menu |
| `<C-h>` | Harpoon file 1 | Jump to first harpoon file |
| `<C-t>` | Harpoon file 2 | Jump to second harpoon file |
| `<C-n>` | Harpoon file 3 | Jump to third harpoon file |
| `<C-s>` | Harpoon file 4 | Jump to fourth harpoon file |

### Todo Comments
| Key | Action | Description |
|-----|--------|-------------|
| `]t` | Next todo | Jump to next TODO comment |
| `[t` | Previous todo | Jump to previous TODO comment |
| `<leader>xt` | Todo trouble | Open todos in trouble |
| `<leader>st` | Todo telescope | Search todos with telescope |

### Package Info (Node.js projects)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ns` | Show versions | Show package versions |
| `<leader>nc` | Hide versions | Hide package versions |
| `<leader>nt` | Toggle versions | Toggle package versions |
| `<leader>nu` | Update package | Update package under cursor |

### Completion (Insert Mode)
| Key | Action | Description |
|-----|--------|-------------|
| `<Tab>` | Next completion | Select next completion item |
| `<S-Tab>` | Previous completion | Select previous completion item |
| `<CR>` | Confirm | Accept selected completion |
| `<C-Space>` | Trigger completion | Manually trigger completion |

## 🎨 Theme & UI

- **Color Scheme**: OneDark Pro (onedark_vivid variant)
- **Status Line**: Lualine with git branch, diagnostics, and file info
- **File Explorer**: nvim-tree with devicons
- **Completion Menu**: Clean, VSCode-like completion interface

## 🔧 Plugin Architecture

### Core Plugins

| Plugin | Purpose | Configuration |
|--------|---------|---------------|
| **lazy.nvim** | Plugin manager | Auto-loading, lazy loading |
| **mason.nvim** | LSP installer | Auto-install LSP servers |
| **nvim-lspconfig** | LSP configurations | Language server setup |
| **nvim-cmp** | Completion engine | Auto-completion |
| **telescope.nvim** | Fuzzy finder | File/content search |
| **nvim-tree.lua** | File explorer | File navigation |
| **treesitter** | Syntax highlighting | Advanced parsing |
| **gitsigns.nvim** | Git integration | Git diff markers |
| **lualine.nvim** | Status line | Information display |

### Additional Features

| Plugin | Purpose |
|--------|---------|
| **onedarkpro.nvim** | Color scheme |
| **nvim-autopairs** | Auto-close brackets |
| **which-key.nvim** | Keybinding help |
| **harpoon** | Quick file navigation |
| **todo-comments.nvim** | TODO highlighting |
| **package-info.nvim** | npm package versions |
| **none-ls.nvim** | Code formatting |

## ⚙️ Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json          # Plugin version lock
├── CLAUDE.md               # AI assistant instructions
├── lua/
│   ├── config/
│   │   ├── options.lua     # Neovim options
│   │   └── keymaps.lua     # Custom keymaps
│   └── plugins/
│       ├── lsp.lua         # LSP configuration
│       ├── telescope.lua   # Fuzzy finder
│       ├── file-explorer.lua # nvim-tree setup
│       ├── theme.lua       # Color scheme
│       ├── git.lua         # Git integration
│       ├── statusline.lua  # Status bar
│       ├── treesitter.lua  # Syntax highlighting
│       ├── harpoon.lua     # File navigation
│       ├── which-key.lua   # Key helper
│       ├── todo-comments.lua # TODO management
│       ├── package-info.lua # npm package info
│       └── null-ls.lua     # Code formatting
```

## 🚀 Usage Tips

1. **First-time setup**: Launch `nvim` and wait for all plugins to install automatically
2. **LSP servers**: Run `:Mason` to see all installed language servers
3. **Find files quickly**: Use `<leader>ff` to find files by name
4. **Search content**: Use `<leader>fg` to search text across your project
5. **File navigation**: Add frequently used files to Harpoon with `<leader>a`
6. **Git workflow**: Use `<leader>gs` to see git changes in the gutter
7. **Code actions**: Press `<leader>ca` on any LSP-supported file for available actions

## 🔄 Auto-formatting

Files are automatically formatted on save:
- **JavaScript/TypeScript/CSS/HTML/JSON**: Uses Prettier
- **Other languages**: Uses LSP built-in formatting
- **Configuration**: Located in `/lua/plugins/null-ls.lua`

## 🎯 Development Settings

- **Clipboard**: Integrated with system clipboard (wl-clipboard)
- **Line numbers**: Relative line numbers enabled
- **Indentation**: 2 spaces (configurable)
- **Search**: Smart case-sensitive search
- **Mouse**: Disabled for keyboard-focused workflow
- **Update time**: 300ms for faster LSP responses

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-feature`
3. Commit changes: `git commit -am 'Add new feature'`
4. Push to branch: `git push origin feature/new-feature`
5. Submit a pull request

## 📝 License

This configuration is open source and available under the [MIT License](LICENSE).

## 🔗 Repository

**GitHub**: [https://github.com/aditya-chaphekar/config-nvim/tree/v3](https://github.com/aditya-chaphekar/config-nvim/tree/v3)

---

*Enjoy your enhanced Neovim experience! 🎉*