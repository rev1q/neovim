return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- カラースキームは最優先ロード
    config = function()
      require("catppuccin").setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
          },
          telescope = true,
          cmp = true,
          gitsigns = true,
        },
      })

      vim.cmd.colorscheme "catppuccin"
    end,
  }
}
