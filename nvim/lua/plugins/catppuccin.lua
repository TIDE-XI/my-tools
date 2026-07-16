-- Catppuccin 白色主题（Latte 风味，永不切暗色）
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "latte",          -- 强制白色
      background = { light = "latte" },
      transparent_background = false,
    })
    vim.cmd("colorscheme catppuccin")
  end,
}
