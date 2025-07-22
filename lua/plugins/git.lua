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
        signcolumn = true,          -- Show signs in the gutter
        current_line_blame = false, -- Disable inline blame by default
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local opts = { buffer = bufnr }

          -- Keybindings for git operations
          vim.keymap.set("n", "<leader>gs", gs.toggle_signs, opts, { desc = "Toggle git signs" })
          vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame, opts, { desc = "Toggle git blame" })
          vim.keymap.set("n", "<leader>gd", gs.diffthis, opts, { desc = "Git diff" })
          vim.keymap.set("n", "<leader>gp", gs.preview_hunk, opts, { desc = "Preview git hunk" })
        end,
      })
    end,
  },
}
