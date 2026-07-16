-- 修复 Windows 假 python3 问题 + 代理
vim.env.PATH = "C:/Users/TIDE/AppData/Local/Python/bin;" .. vim.env.PATH
vim.env.HTTPS_PROXY = "http://127.0.0.1:5040"
vim.env.HTTP_PROXY = "http://127.0.0.1:5040"
require("config.lazy")
require("core.options")
require("core.keymaps")
require("core.writing")
require("core.image-cache")
require("notify").setup({
  background_colour = "#FFFFFF",
})
require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "cpp", "java", "python", "markdown", "markdown_inline" },
        highlight = { enable = true },
      })
    end,
  },
})
