-- 文件管理器：最高星的文件树
return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "文件树" },
      { "<leader>ef", "<cmd>NvimTreeFindFile<CR>", desc = "定位当前文件" },
    },
    opts = {
      sort = { sorter = "name" },
      view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
      },
      renderer = {
        group_empty = true,
        icons = { show = { file = true, folder = true, folder_arrow = true } },
      },
      update_focused_file = { enable = true, update_root = false },
      filters = { dotfiles = false },
    },
  },
}
