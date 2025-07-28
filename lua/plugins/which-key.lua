return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
          presets = {
            operators = false,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
        },
        window = {
          border = "rounded",
          position = "bottom",
          margin = { 1, 0, 1, 0 },
          padding = { 2, 2, 2, 2 },
          winblend = 0
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 50 },
          spacing = 3,
          align = "left",
        },
        ignore_missing = true,
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
        show_help = true,
        triggers = "auto",
        triggers_blacklist = {
          i = { "j", "k" },
          v = { "j", "k" },
        },
      })

      wk.register({
        f = {
          name = "file", 
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
          b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
          r = { "Find and replace word under cursor" },
        },
        g = {
          name = "git",
          s = { "Toggle git signs" },
          b = { "Toggle git blame" },
          d = { "Git diff" },
          p = { "Preview git hunk" },
        },
        c = {
          name = "code",
          a = { "Code actions" },
        },
        r = {
          name = "rename",
          n = { "Rename symbol" },
        },
        e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
        a = { "Add to harpoon" },
        x = {
          name = "diagnostics",
          t = { "Todo (Trouble)" },
          T = { "Todo/Fix/Fixme (Trouble)" },
        },
        s = {
          name = "search",
          t = { "Todo" },
          T = { "Todo/Fix/Fixme" },
        },
      }, { prefix = "<leader>" })
    end,
  },
}