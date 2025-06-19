# Neovim Config & Setup Script

This project provides a one-command setup for a modern, full-featured Neovim development environment on Arch Linux (or Arch-based distros). It installs Neovim, all required dependencies, and a curated plugin configuration using [lazy.nvim](https://github.com/folke/lazy.nvim).

## Features

- **Automated installation** of Neovim, language servers, linters, formatters, and essential tools.
- **Pre-configured Neovim** with:
  - [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) theme
  - LSP support for JS/TS, Go, Rust, Python, Bash, Docker, Nginx, TailwindCSS, and more
  - Autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - File explorer ([nvim-tree](https://github.com/nvim-tree/nvim-tree.lua))
  - Fuzzy finder ([telescope.nvim](https://github.com/nvim-telescope/telescope.nvim))
  - Statusline ([lualine.nvim](https://github.com/nvim-lualine/lualine.nvim))
  - Git integration ([gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim))
  - Treesitter syntax highlighting
  - Format-on-save and linting for many languages
  - Commenting, TODO management, and more

## Prerequisites

- **Arch Linux** or an Arch-based distro (uses `pacman` and `paru`)
- [paru](https://github.com/Morganamilo/paru) AUR helper installed
- Internet connection

## Installation

1. **Clone this repository:**
   ```sh
   git clone git@github.com:aditya-chaphekar/config-nvim.git aditya-nvim-config
   cd aditya-nvim-config
   ```

2. **Run the setup script:**
   ```sh
   chmod +x setup.sh
   ./setup.sh
   ```

   The script will:
   - Install Neovim and dependencies (git, gcc, ripgrep, go, rustup, shfmt, shellcheck, etc.)
   - Install [uv](https://github.com/astral-sh/uv), [nvm](https://github.com/nvm-sh/nvm), Node.js, pnpm, and corepack
   - Install global npm/pnpm packages (prettier, eslint, neovim, language servers)
   - Set up a Python virtual environment for Neovim with `pynvim`, `pyright`, `black`, and `ruff`
   - Backup any existing Neovim config to `~/.config/nvim.bak`
   - Write a new Neovim config with all plugins and settings

3. **Start Neovim:**
   ```sh
   nvim
   ```
   The first launch will install all plugins via lazy.nvim.

## Notes

- If you use a shell other than Bash or Zsh, you may need to manually source nvm:
  ```sh
  source /usr/share/nvm/init-nvm.sh
  ```
- The script assumes you have `paru` installed for AUR packages.
- Your previous Neovim config (if any) will be backed up to `~/.config/nvim.bak`.

## Customization

- All plugin configs are in `~/.config/nvim/lua/plugins/`.
- You can add or modify plugins by editing these files.

## Included Plugins & Tools

- **LSP:** mason.nvim, mason-lspconfig.nvim, nvim-lspconfig
- **Completion:** nvim-cmp, LuaSnip
- **UI:** tokyonight.nvim, lualine.nvim, nvim-tree, telescope.nvim, which-key.nvim
- **Git:** gitsigns.nvim
- **Syntax:** nvim-treesitter
- **Formatting/Linting:** conform.nvim, nvim-lint, prettier, eslint, black, ruff, shfmt, hadolint, golangci-lint
- **Other:** Comment.nvim, todo-comments.nvim

## Troubleshooting

- If you encounter issues with mirrors or package installation, the script will attempt to refresh mirrors using `reflector`.
- For any manual steps or errors, review the output of the script for instructions.

## Keybindings Cheatsheet

| Keybinding         | Mode      | Description                        | Plugin/Feature         |
|--------------------|-----------|------------------------------------|------------------------|
| `<leader>e`        | Normal    | Toggle file explorer               | nvim-tree             |
| `<leader>ff`       | Normal    | Find files                         | telescope.nvim         |
| `<leader>fg`       | Normal    | Live grep (search in files)        | telescope.nvim         |
| `<leader>fb`       | Normal    | Find buffers                       | telescope.nvim         |
| `<leader>c`        | Normal    | LSP Code Actions (group)           | which-key              |
| `<leader>h`        | Normal    | Git (gitsigns) (group)             | which-key/gitsigns     |
| `<leader>hs`       | Normal    | Stage hunk                         | gitsigns.nvim          |
| `<leader>hr`       | Normal    | Reset hunk                         | gitsigns.nvim          |
| `<leader>hS`       | Normal    | Stage buffer                       | gitsigns.nvim          |
| `<leader>hu`       | Normal    | Undo stage hunk                    | gitsigns.nvim          |
| `<leader>hp`       | Normal    | Preview hunk                       | gitsigns.nvim          |
| `<leader>hb`       | Normal    | Blame line                         | gitsigns.nvim          |
| `<leader>hd`       | Normal    | Diff this                          | gitsigns.nvim          |
| `<leader>r`        | Normal    | LSP Rename (group)                 | which-key/LSP          |
| `<leader>t`        | Normal    | TODO Comments (group)              | which-key/todo-comments|
| `<leader>tt`       | Normal    | Search TODOs                       | todo-comments.nvim     |
| `<leader>tq`       | Normal    | TODO Quickfix List                 | todo-comments.nvim     |
| `]t`               | Normal    | Next TODO Comment                  | todo-comments.nvim     |
| `[t`               | Normal    | Previous TODO Comment              | todo-comments.nvim     |
| `gd`               | Normal    | Go to definition                   | LSP                    |
| `K`                | Normal    | Hover (show documentation)         | LSP                    |
| `<leader>rn`       | Normal    | Rename symbol                      | LSP                    |
| `<leader>ca`       | Normal    | Code action                        | LSP                    |
| `]c`               | Normal    | Next git hunk                      | gitsigns.nvim          |
| `[c`               | Normal    | Previous git hunk                  | gitsigns.nvim          |
| `<C-Space>`        | Visual    | Treesitter: Incremental selection  | nvim-treesitter        |
| `<C-s>`            | Visual    | Treesitter: Scope incremental      | nvim-treesitter        |
| `<C-Backspace>`    | Visual    | Treesitter: Node decremental       | nvim-treesitter        |
| `<C-b>`            | Insert    | Scroll docs up (completion)        | nvim-cmp               |
| `<C-f>`            | Insert    | Scroll docs down (completion)      | nvim-cmp               |
| `<C-Space>`        | Insert    | Trigger completion                 | nvim-cmp               |
| `<C-e>`            | Insert    | Abort completion                   | nvim-cmp               |
| `<CR>`             | Insert    | Confirm completion                 | nvim-cmp               |
| `<Tab>`            | Insert    | Next completion/snippet            | nvim-cmp/LuaSnip       |
| `<S-Tab>`          | Insert    | Previous completion/snippet        | nvim-cmp/LuaSnip       |

**Legend:**  
- `<leader>` is set to the spacebar (` `).
- "Group" means a prefix for related commands, shown in which-key popups.

---

Feel free to copy, edit, or expand this README as needed for your project! 
