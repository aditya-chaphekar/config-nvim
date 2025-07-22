-- General settings
vim.opt.clipboard = "unnamedplus" -- Use system clipboard with wl-clipboard
vim.opt.termguicolors = true      -- Enable 24-bit RGB colors
vim.g.mapleader = " "             -- Set leader key to space
vim.g.maplocalleader = " "        -- Set local leader key to space
vim.opt.relativenumber = true     -- Show relative line numbers
vim.opt.expandtab = true          -- Convert tabs to spaces
vim.opt.tabstop = 2               -- 2 spaces for tabs
vim.opt.shiftwidth = 2            -- 2 spaces for indentation
vim.opt.softtabstop = 2           -- 2 spaces for tab in insert mode
vim.opt.autoindent = true         -- Copy indentation from previous line
vim.opt.smartindent = true        -- Smart indenting for C-like languages
vim.opt.wrap = true               -- Wrap long lines
vim.opt.ignorecase = true         -- Case-insensitive searching
vim.opt.smartcase = true          -- Case-sensitive if uppercase in search
vim.opt.mouse = ""                -- Disable mouse support
vim.opt.updatetime = 300          -- Faster updates for LSP and events
vim.opt.timeoutlen = 500          -- Balanced timeout for keymap sequences
