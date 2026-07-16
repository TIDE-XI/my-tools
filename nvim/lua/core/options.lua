local opt=vim.opt
--行号
opt.relativenumber=true
opt.number=true
--缩进
opt.tabstop=4
opt.shiftwidth=4
opt.expandtab=true
opt.autoindent=true

--防止包裹
opt.wrap=false 
--光标行
opt.cursorline=true
--启用鼠标
opt.mouse:append("a")
--系统剪贴板
opt.clipboard:append("unnamedplus")
--默认新窗口为位置为右和下
opt.splitright=true
opt.splitbelow=true
--搜索
opt.ignorecase=true
opt.smartcase=true
--外观
opt.termguicolors=true
opt.signcolumn="yes"
opt.background="light"
--SUOJING
vim.opt.cindent=true;vim.opt.shiftwidth=4;vim.opt.tabstop=4;vim.opt.expandtab=true
vim.keymap.set('i','<CR>',function()
  local col=vim.fn.col('.')
  local line=vim.fn.getline('.')
  return line:sub(col-1,col-1)=='{' and line:sub(col,col)=='}' and '<CR><Esc>O' or '<CR>'
end,{expr=true})