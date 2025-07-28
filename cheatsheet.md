# 🚀 Neovim Configuration Cheatsheet

> **Leader Key:** `<Space>` • **Timeout:** 300ms

---

## 📁 File Management & Navigation

### File Explorer (nvim-tree)
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>e` | Toggle File Explorer | Open/close nvim-tree file browser |

**Within nvim-tree:**
| Key | Action |
|-----|--------|
| `<CR>` | Open file/folder |
| `o` | Open file/folder |
| `<2-LeftMouse>` | Open file/folder |
| `<C-]>` | CD into directory |
| `<C-v>` | Open in vertical split |
| `<C-x>` | Open in horizontal split |
| `<C-t>` | Open in new tab |
| `<Tab>` | Open as preview |
| `P` | Go to parent |
| `<BS>` | Close current opened directory |
| `q` | Close tree |
| `R` | Refresh tree |
| `a` | Create file |
| `d` | Delete file |
| `r` | Rename file |
| `x` | Cut file |
| `c` | Copy file |
| `p` | Paste file |
| `y` | Copy filename |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |
| `I` | Toggle git ignored files |
| `H` | Toggle hidden files |
| `g?` | Show help |

---

## 🔍 Search & Fuzzy Finding

### Telescope
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>ff` | Find Files | Search files with Telescope fuzzy finder |
| `<leader>fg` | Live Grep | Search text across entire project |
| `<leader>fb` | Search Buffer | Search within current file |

**Within Telescope:**
| Key | Action |
|-----|--------|
| `<C-n>` / `<Down>` | Next item |
| `<C-p>` / `<Up>` | Previous item |
| `j` / `k` | Next/Previous (in normal mode) |
| `H` / `M` / `L` | Select High/Middle/Low |
| `gg` / `G` | Select first/last |
| `<C-u>` / `<C-d>` | Scroll up/down in preview |
| `<C-/>` | Show mappings |
| `<C-c>` | Close telescope |
| `<Esc>` | Close telescope (in normal mode) |
| `<CR>` | Confirm selection |
| `<C-x>` | Go to file selection as split |
| `<C-v>` | Go to file selection as vsplit |
| `<C-t>` | Go to file selection as tab |
| `<Tab>` | Toggle selection and move to next |
| `<S-Tab>` | Toggle selection and move to prev |
| `<C-q>` | Send all to quickfixlist |
| `<M-q>` | Send selected to quickfixlist |

---

## 🎯 Harpoon (Quick File Navigation)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>a` | Add to Harpoon | Mark current file for quick access |
| `<C-e>` | Toggle Harpoon Menu | Show/hide quick menu |
| `<C-h>` | Go to File 1 | Jump to first marked file |
| `<C-t>` | Go to File 2 | Jump to second marked file |
| `<C-n>` | Go to File 3 | Jump to third marked file |
| `<C-s>` | Go to File 4 | Jump to fourth marked file |
| `<C-S-P>` | Previous File | Go to previous in harpoon list |
| `<C-S-N>` | Next File | Go to next in harpoon list |

---

## 🔧 Language Server Protocol (LSP)

### Core LSP Actions
| Keybinding | Action | Description |
|------------|--------|-------------|
| `gd` | Go to Definition | Jump to symbol definition |
| `K` | Hover Documentation | Show documentation for symbol under cursor |
| `<leader>ca` | Code Actions | Show available code actions |
| `<leader>rn` | Rename Symbol | Rename symbol across project |

### Additional LSP Keybindings (Default)
| Key | Action |
|-----|--------|
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `<C-k>` | Signature help |
| `<leader>wa` | Add workspace folder |
| `<leader>wr` | Remove workspace folder |
| `<leader>wl` | List workspace folders |
| `<leader>D` | Type definition |
| `<leader>f` | Format buffer |

---

## 📝 Completion & Editing

### nvim-cmp Completion
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<Tab>` | Next Completion | Navigate to next completion item |
| `<Shift-Tab>` | Previous Completion | Navigate to previous completion item |
| `<CR>` | Confirm Completion | Accept selected completion |
| `<C-Space>` | Trigger Completion | Manually trigger completion menu |
| `<C-e>` | Abort Completion | Close completion menu |
| `<C-b>` | Scroll Docs Up | Scroll documentation up |
| `<C-f>` | Scroll Docs Down | Scroll documentation down |

### Custom Editing
| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>fr` | Find & Replace | Find and replace word under cursor |

---

## 🔄 Git Integration (Gitsigns)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `<leader>gs` | Toggle Git Signs | Show/hide git diff indicators |
| `<leader>gb` | Toggle Git Blame | Show/hide git blame information |
| `<leader>gd` | Git Diff | Show git diff for current file |
| `<leader>gp` | Preview Git Hunk | Preview changes in current hunk |

### Default Gitsigns Actions
| Key | Action |
|-----|--------|
| `]c` | Next hunk |
| `[c` | Previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hR` | Reset buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>tb` | Toggle current line blame |
| `<leader>hd` | Diff this |
| `<leader>hD` | Diff this ~ |
| `<leader>td` | Toggle deleted |

---

## 📋 TODO Comments

| Keybinding | Action | Description |
|------------|--------|-------------|
| `]t` | Next TODO | Jump to next todo comment |
| `[t` | Previous TODO | Jump to previous todo comment |
| `<leader>xt` | Todo Trouble | Show todos in Trouble |
| `<leader>xT` | Todo/Fix/Fixme Trouble | Show todos/fixes in Trouble |
| `<leader>st` | Todo Telescope | Search todos with Telescope |
| `<leader>sT` | Todo/Fix/Fixme Telescope | Search todos/fixes with Telescope |

### TODO Keywords
- **FIX/FIXME/BUG/FIXIT/ISSUE**: 🔴 Error level
- **TODO**: 🔵 Info level  
- **HACK**: 🟡 Warning level
- **WARN/WARNING/XXX**: 🟡 Warning level
- **PERF/OPTIM/PERFORMANCE/OPTIMIZE**: Performance notes
- **NOTE/INFO**: 💡 Hint level
- **TEST/TESTING/PASSED/FAILED**: 🧪 Test level

---

## ❓ Which-Key Help System

| Key | Action |
|-----|--------|
| `<leader>` | Show which-key popup (after 300ms) |

**Which-key shows contextual help for:**
- `<leader>f` → File operations
- `<leader>g` → Git operations  
- `<leader>c` → Code actions
- `<leader>r` → Rename operations
- `<leader>x` → Diagnostics
- `<leader>s` → Search operations

---

## 🛠️ Language Servers (Mason-managed)

| Language | Server | Auto-installed |
|----------|--------|----------------|
| **Lua** | `lua_ls` | ✅ (with Vim globals) |
| **Go** | `gopls` | ✅ |
| **Rust** | `rust_analyzer` | ✅ |
| **Python** | `pyright` | ✅ |
| **Java** | `jdtls` | ✅ |
| **TypeScript/JS** | `ts_ls` | ✅ |
| **HTML** | `html` | ✅ |
| **Bash** | `bashls` | ✅ |
| **TailwindCSS** | `tailwindcss` | ✅ |

### Formatting Tools
| Tool | Languages | Auto-installed |
|------|-----------|----------------|
| **Prettier** | JS, TS, CSS, HTML, JSON, MD, YAML | ✅ |
| **ESLint** | JavaScript/TypeScript | ✅ |

---

## 🎨 Visual & UI

### Status Line (Lualine)
- **Left**: Mode, branch, diff stats
- **Center**: Filename, file status
- **Right**: Diagnostics, file type, cursor position

### Theme: OneDarkPro
- Dark theme optimized for coding
- Syntax highlighting for all supported languages
- Integrated with git signs and diagnostics

---

## ⚙️ Editor Configuration

| Setting | Value | Description |
|---------|-------|-------------|
| **Leader Key** | `<Space>` | Primary prefix key |
| **Timeout** | 300ms | Key sequence timeout |
| **Indentation** | 2 spaces | Consistent spacing |
| **Line Numbers** | Relative | Enhanced navigation |
| **Clipboard** | System (wl-clipboard) | Copy/paste integration |
| **Mouse** | Disabled | Keyboard-focused workflow |
| **Update Time** | 300ms | Faster LSP responses |
| **Search** | Smart case | Intelligent case matching |

---

## 🔌 Plugin Management (Lazy.nvim)

### Lazy Commands
| Command | Action |
|---------|--------|
| `:Lazy` | Open Lazy UI |
| `:Lazy sync` | Update all plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Lazy profile` | Show startup profile |

---

## 🎯 Pro Tips

1. **Which-Key Integration**: Wait 300ms after `<leader>` to see available commands
2. **Telescope Preview**: Use `<C-u>/<C-d>` to scroll in preview pane
3. **Harpoon Workflow**: Mark files with `<leader>a`, quick access with `<C-h/t/n/s>`
4. **TODO Comments**: Use recognized keywords in comments for automatic highlighting
5. **Auto-formatting**: Files auto-format on save (Prettier for web, LSP for others)
6. **Git Integration**: All git operations available through `<leader>g*` commands

---

*✨ Happy coding with Neovim! Press `<leader>` and wait to discover more commands.*