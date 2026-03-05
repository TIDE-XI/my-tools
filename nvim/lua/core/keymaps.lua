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
