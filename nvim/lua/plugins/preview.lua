-- Markdown 浏览器预览 + 辅助工具
return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = "cd app && npx --yes yarn install",
    keys = { { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "浏览器预览" } },
    config = function()
      vim.g.mkdp_auto_start = false
    end,
  },
  {
    "folke/snacks.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>si",
        function() require("snacks.image").hover() end,
        desc = "显示本地图片",
      },
    },
    opts = {
      image = {
        enabled = true,
        force = true,
        doc = { enabled = true },
      },
    },
  },
}
