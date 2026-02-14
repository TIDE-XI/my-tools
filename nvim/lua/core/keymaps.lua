vim.g.mapleader = " "
local keymap= vim.keymap
vim.o.timeoutlen=200
--插入模式--
keymap.set("i","ii","<Esc>")
--视觉模式--


--正常模式--
--窗口--
keymap.set("n","<leader>sv","<C-w>v")--水平新增窗口
keymap.set("n","<leader>sh","<C-w>s")--垂直新增窗口

--取消高亮
keymap.set("n","<leader>;",":nohl<CR>")
--插件--
--nvim-tree--
keymap.set("n","<leader>e",":NvimTreeToggle<CR>")
--CompetiTest 快捷键
keymap.set('n', '<leader>r', ':CompetiTest run<CR>', { desc = '运行测试' })
keymap.set('n', '<leader>ri', ':CompetiTest receive problem<CR>', { desc = '接收单个题目' })
keymap.set('n', '<leader>ra', ':CompetiTest receive persistently<CR>', { desc = '持续接收题目' })
keymap.set('n', '<leader>rd', ':CompetiTest delete_testcase<CR>', { desc = '删除测试用例' })
