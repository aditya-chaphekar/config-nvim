return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads early
    config = function()
      require("onedarkpro").setup({
        -- Use the 'onedark' variant (default dark theme)
        theme = "onedark_vivid",
      })
      vim.cmd("colorscheme onedark_vivid")
    end,
  },
}
