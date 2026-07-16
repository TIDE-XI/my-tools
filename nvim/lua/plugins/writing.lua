-- 专注写作套装：无干扰模式 + 段落聚焦 + 打字机滚动
return {
  {
    "folke/zen-mode.nvim",
    keys = { { "<leader>zz", "<cmd>ZenMode<CR>", desc = "写作专注模式" } },
    opts = {
      window = {
        backdrop = 1,
        width = 80,
        height = 1,
        options = { signcolumn = "no", number = false, relativenumber = false },
      },
      plugins = {
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
      },
      on_open = function() vim.opt.wrap = true end,
      on_close = function() vim.opt.wrap = false end,
    },
  },
  {
    "folke/twilight.nvim",
    opts = { dimming = { alpha = 0.25, color = { "#000000" } } },
  },
  {
    "joshuadanpeterson/typewriter.nvim",
    event = "VeryLazy",
    config = function()
      require("typewriter").setup({
        scroll_offset = 8,
        auto_center = true,
      })
    end,
  },

}
