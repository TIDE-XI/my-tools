-- 文件搜索 + Markdown 元数据搜索
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "搜索文件" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "全文搜索" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "切换缓冲区" },
      { "<leader>fm", "<cmd>Telescope markdown_frontmatter<CR>", desc = "搜索元数据" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top", height = 0.85 },
          sorting_strategy = "ascending",
        },
      })
    end,
  },
  {
    "tkancf/telescope-markdown-frontmatter.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("markdown_frontmatter")
    end,
  },
}
