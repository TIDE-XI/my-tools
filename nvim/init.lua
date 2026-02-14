vim.g.lualine_theme = 'vscode'
require("plugins.plugins-setup")
require("core.options")
require("core.keymaps")
--插件
require('plugins.lualine')
require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.comment")
require('vscode').load('light')
require("plugins.competitest")