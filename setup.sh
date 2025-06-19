#!/bin/bash

# Exit on error
set -e

# Step 1: Install Neovim and Dependencies
echo "Checking for Neovim..."
if ! command -v nvim &>/dev/null; then
  echo "Neovim not found. Installing via pacman..."
  sudo pacman -S --needed neovim
else
  echo "Neovim is already installed."
fi

echo "Checking for reflector..."
if ! command -v reflector &>/dev/null; then
  echo "reflector not found. Installing via pacman..."
  sudo pacman -S --needed reflector
else
  echo "reflector is already installed."
fi

# echo "Refreshing mirror list with reflector..."
# sudo reflector --country 'United States,India,Germany' --latest 10 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist
# sudo pacman -Syy

echo "Installing dependencies (git, gcc, ripgrep, go, rustup, lua-jsregexp, shfmt, shellcheck)..."
if ! sudo pacman -S --needed git gcc ripgrep go rustup lua-jsregexp shfmt shellcheck; then
  echo "pacman failed, likely due to mirror issues. Refreshing mirrors again..."
  sudo reflector --country 'United States,India,Germany' --latest 10 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist
  sudo pacman -Syy
  sudo pacman -S --needed git gcc ripgrep go rustup lua-jsregexp shfmt shellcheck
fi

echo "Checking for uv..."
if ! command -v uv &>/dev/null; then
  echo "uv not found. Installing via paru..."
  paru -S --needed uv
else
  echo "uv is already installed."
fi

echo "Checking for nvm..."
if command -v nvm &>/dev/null; then
  echo "nvm is already installed."
else
  echo "nvm not found. Installing via paru..."
  paru -S --needed nvm
  source /usr/share/nvm/init-nvm.sh
  echo "Please add the following to ~/.zshrc or ~/.bashrc to load nvm:"
  echo 'source /usr/share/nvm/init-nvm.sh'
fi

echo "Checking for Node.js..."
if ! nvm ls | grep -q "node"; then
  echo "Installing latest Node.js via nvm..."
  nvm install node
  nvm use node
else
  echo "Node.js is already installed via nvm."
fi

echo "Enabling pnpm via corepack..."
corepack enable
corepack prepare pnpm@latest --activate
echo "pnpm enabled via corepack."

echo "Checking for golangci-lint..."
if ! command -v golangci-lint &>/dev/null; then
  echo "Installing golangci-lint via paru..."
  paru -S --needed golangci-lint-bin
else
  echo "golangci-lint is already installed."
fi

echo "Checking for bash-language-server..."
if ! command -v bash-language-server &>/dev/null; then
  echo "bash-language-server not found. Installing via pnpm..."
  pnpm install -g bash-language-server
else
  echo "bash-language-server is already installed."
fi

echo "Checking for tailwindcss-language-server..."
if ! command -v tailwindcss-language-server &>/dev/null; then
  echo "tailwindcss-language-server not found. Installing via pnpm..."
  pnpm install -g @tailwindcss/language-server
else
  echo "tailwindcss-language-server is already installed."
fi

echo "Checking for dockerfile-language-server..."
if ! command -v dockerfile-language-server &>/dev/null; then
  echo "dockerfile-language-server not found. Installing via pnpm..."
  pnpm install -g @microsoft/compose-language-service dockerfile-language-server-nodejs
else
  echo "dockerfile-language-server is already installed."
fi

echo "Checking for hadolint..."
if ! command -v hadolint &>/dev/null; then
  echo "hadolint not found. Installing via paru..."
  paru -S --needed hadolint-bin
else
  echo "hadolint is already installed."
fi

echo "Installing prettier, eslint, and neovim globally via pnpm..."
pnpm install -g prettier eslint neovim

echo "Installing Python dependencies (pynvim, pyright, black, ruff) using uv..."
# Create a virtual environment and install Python dependencies
uv venv ~/.local/share/nvim/venv
source ~/.local/share/nvim/venv/bin/activate
uv pip install pynvim pyright black ruff
deactivate

echo "Dependencies installed."

# Step 2: Create Neovim Configuration
echo "Setting up Neovim configuration..."

# Backup existing Neovim config if it exists
if [ -d ~/.config/nvim ]; then
  echo "Existing Neovim configuration found. Backing up to ~/.config/nvim.bak..."
  rm -rf ~/.config/nvim.bak
  mv ~/.config/nvim ~/.config/nvim.bak
fi

# Create Neovim config directory
mkdir -p ~/.config/nvim/lua/plugins

# Create init.lua
cat >~/.config/nvim/init.lua <<'EOF'
-- Disable Perl and Ruby providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Set Python 3 provider to uv virtual environment
vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/venv/bin/python")

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim with plugins
require("lazy").setup({
  { import = "plugins.tokyonight" },
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  { import = "plugins.explorer" },
  { import = "plugins.lualine" },
  { import = "plugins.gitsigns" },
  { import = "plugins.treesitter" },
  { import = "plugins.whichkey" },
  { import = "plugins.format_lint" },
  { import = "plugins.comment" },
  { import = "plugins.todo_comments" },
  { import = "plugins.terminal" },
}, {
  performance = {
    rtp = {
      disabled_plugins = { "netrwPlugin" },
    },
  },
  rocks = {
    enabled = false, -- Disable luarocks
  },
})

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
EOF

# Create tokyonight.lua
cat >~/.config/nvim/lua/plugins/tokyonight.lua <<'EOF'
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
EOF

# Create lsp.lua
cat >~/.config/nvim/lua/plugins/lsp.lua <<'EOF'
return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({ ui = { border = "rounded" } })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "gopls",
          "rust_analyzer",
          "pyright",
          "bashls",
          "tailwindcss",
          "dockerls",
          "nginx"
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason.nvim", "mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup {}
      lspconfig.gopls.setup {}
      lspconfig.rust_analyzer.setup {}
      lspconfig.pyright.setup {}
      lspconfig.bashls.setup {}
      lspconfig.tailwindcss.setup {}
      lspconfig.dockerls.setup {}
      lspconfig.nginx.setup {}
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}
EOF

# Create cmp.lua
cat >~/.config/nvim/lua/plugins/cmp.lua <<'EOF'
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
        }),
      })
    end,
  },
}
EOF

# Create explorer.lua
cat >~/.config/nvim/lua/plugins/explorer.lua <<'EOF'
return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
    },
    config = function()
      -- Disable netrw explicitly
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        renderer = { group_empty = true, highlight_git = true },
        filters = { dotfiles = false },
      })

      -- Auto-open nvim-tree on startup, including when opening a directory
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function(data)
          -- Check if a directory was passed as an argument
          local directory = vim.fn.isdirectory(data.file) == 1
          if directory then
            -- Close the directory buffer opened by Neovim
            vim.cmd("bwipeout")
            -- Change to the directory
            vim.cmd("cd " .. data.file)
            -- Open nvim-tree
            require("nvim-tree.api").tree.open()
          else
            -- Open nvim-tree for non-directory cases
            require("nvim-tree.api").tree.open()
          end
        end,
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
            },
          },
        },
      })
    end,
  },
}
EOF

# Create lualine.lua
cat >~/.config/nvim/lua/plugins/lualine.lua <<'EOF'
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "diagnostics", "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
EOF

# Create gitsigns.lua
cat >~/.config/nvim/lua/plugins/gitsigns.lua <<'EOF'
return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "-" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true, desc = "Next git hunk" })
          map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true, desc = "Previous git hunk" })
          map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
          map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
          map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, { desc = "Stage hunk" })
          map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, { desc = "Reset hunk" })
          map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
          map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
          map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
          map("n", "<leader>hb", function() gs.blame_line { full = true } end, { desc = "Blame line" })
          map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
        end,
      })
    end,
  },
}
EOF

# Create treesitter.lua
cat >~/.config/nvim/lua/plugins/treesitter.lua <<'EOF'
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "javascript",
          "typescript",
          "tsx",
          "go",
          "rust",
          "json",
          "yaml",
          "markdown",
          "comment",
          "python",
          "bash",
          "dockerfile",
          "nginx"
        },
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-Space>",
            node_incremental = "<C-Space>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-Backspace>",
          },
        },
        indent = { enable = true },
      })
    end,
  },
}
EOF

# Create whichkey.lua
cat >~/.config/nvim/lua/plugins/whichkey.lua <<'EOF'
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = { enabled = true, suggestions = 20 },
          presets = { operators = true, motions = true, text_objects = true },
        },
        win = {
          border = "single",
          position = "bottom",
          margin = { 1, 0, 1, 0 },
          padding = { 1, 2, 1, 2 },
        },
      })
      wk.add({
        { "<leader>c", group = "LSP Code Actions" },
        { "<leader>e", group = "File Explorer (nvim-tree)" },
        { "<leader>f", group = "Fuzzy Finder (telescope)" },
        { "<leader>h", group = "Git (gitsigns)" },
        { "<leader>r", group = "LSP Rename" },
        { "<leader>t", group = "TODO Comments" },
      })
    end,
  },
}
EOF

# Create format_lint.lua
cat >~/.config/nvim/lua/plugins/format_lint.lua <<'EOF'
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          tsx = { "prettier" },
          json = { "prettier" },
          go = { "gofmt" },
          rust = { "rustfmt" },
          python = { "black" },
          sh = { "shfmt" },
          dockerfile = { "prettier" },
          nginx = { "prettier" }
        },
        format_on_save = { timeout_ms = 500, lsp_fallback = true },
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost" },
    config = function()
      require("lint").linters_by_ft = {
        javascript = { "eslint" },
        typescript = { "eslint" },
        tsx = { "eslint" },
        go = { "golint" },
        rust = { "cargo" },
        python = { "ruff" },
        sh = { "shellcheck" },
        dockerfile = { "hadolint" }
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
EOF

# Create comment.lua
cat >~/.config/nvim/lua/plugins/comment.lua <<'EOF'
return {
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("Comment").setup()
    end,
  },
}
EOF

# Create todo_comments.lua
cat >~/.config/nvim/lua/plugins/todo_comments.lua <<'EOF'
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = true,
      sign_priority = 8,
      keywords = {
        FIX = {
          icon = " ",
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      merge_keywords = true,
      highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before = "",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]],
      },
    },
    keys = {
      { "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "Search TODOs" },
      { "<leader>tq", "<cmd>TodoQuickFix<cr>", desc = "TODO Quickfix List" },
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous TODO Comment" },
    },
  },
}
EOF

# Create terminal.lua
cat >~/.config/nvim/lua/plugins/terminal.lua <<'EOF'
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-`>]],
        shade_terminals = true,
        direction = "float",
        float_opts = {
          border = "curved",
        },
      })
      -- Keybindings for terminal
      vim.keymap.set({"n", "t"}, "<leader>tt", "<cmd>ToggleTerm<cr>", {desc = "Toggle terminal"})
      vim.keymap.set({"n", "t"}, "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", {desc = "Horizontal terminal"})
      vim.keymap.set({"n", "t"}, "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", {desc = "Vertical terminal"})
      vim.keymap.set({"n", "t"}, "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", {desc = "Floating terminal"})
    end,
  },
}
EOF

echo "Neovim configuration set up with lazy.nvim and all plugins."
echo "Setup complete! Run 'nvim' to start Neovim and let lazy.nvim install plugins."
