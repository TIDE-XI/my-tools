-- 批量搜索和替换（自动使用 ripgrep）
return {
  {
    "wincent/ferret",
    keys = {
      { "<leader>rw", "<Plug>(FerretAckWord)", desc = "搜索光标下单词" },
      { "<leader>ra", "<cmd>Ack<space>", desc = "全局搜索" },
      { "<leader>rl", "<cmd>Lack<space>", desc = "当前文件搜索" },
    },
    config = function()
      vim.g.FerretMap = 0 -- 禁用默认映射，使用上面自定义
      vim.g.FerretExecutable = "rg"
      vim.g.FerretExecutableArguments = {
        "--no-heading", "--with-filename", "--line-number", "--color=never",
      }
    end,
  },
}
