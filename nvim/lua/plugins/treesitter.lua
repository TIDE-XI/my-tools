require('nvim-treesitter').setup {
  -- 自动安装的语言解析器
  ensure_installed = {
    "vim", "vimdoc", "lua", "python",
    "c", "cpp", "javascript", "typescript",
    "json", "html", "css", "markdown",
    "bash", "powershell", "java", "help"
  },
  
  -- 同步安装（安装插件时自动安装语言解析器）
  sync_install = false,
  
  -- 自动安装缺失的语言解析器
  auto_install = true,
  
  -- 语法高亮
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  
  -- 基于语法的缩进
  indent = {
    enable = true,
  },
  
  -- 增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

