-- NOTE: This enables numbering on left side of the editor along with fancy numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- NOTE: Hide mode, as already shown in Status line
vim.opt.showmode = false

-- NOTE: Sync Clipboard
vim.opt.clipboard = 'unnamedplus'

-- NOTE: Enable break indent
vim.opt.breakindent = true

-- NOTE: Save undo history
vim.opt.undofile = true

-- NOTE: Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- NOTE: Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- NOTE:  Decrease update time
vim.opt.updatetime = 250

-- NOTE: Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- NOTE: Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- NOTE: ets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- NOTE: Show which line your cursor is on
vim.opt.cursorline = true

-- NOTE: Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- NOTE: Set highlight on search
vim.opt.hlsearch = true
