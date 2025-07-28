return {
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("package-info").setup({
        colors = {
          up_to_date = "#3C4142",
          outdated = "#d19a66",
        },
        icons = {
          enable = true,
          style = {
            up_to_date = "|  ",
            outdated = "|  ",
          },
        },
        autostart = true,
        hide_up_to_date = false,
        hide_unstable_versions = false,
        package_manager = "npm",
      })

      vim.keymap.set("n", "<leader>ns", require("package-info").show, { desc = "Show dependency versions" })
      vim.keymap.set("n", "<leader>nc", require("package-info").hide, { desc = "Hide dependency versions" })
      vim.keymap.set("n", "<leader>nt", require("package-info").toggle, { desc = "Toggle dependency versions" })
      vim.keymap.set("n", "<leader>nu", require("package-info").update, { desc = "Update dependency on the line" })
      vim.keymap.set("n", "<leader>nd", require("package-info").delete, { desc = "Delete dependency on the line" })
      vim.keymap.set("n", "<leader>ni", require("package-info").install, { desc = "Install a new dependency with version" })
      vim.keymap.set("n", "<leader>np", require("package-info").change_version, { desc = "Install a different dependency version" })
    end,
  },
}