-- 小说写作自动配置：进入 markdown 文件时启用写作模式
local writing = vim.api.nvim_create_augroup("WritingMode", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = writing,
  pattern = { "markdown", "text", "txt" },
  callback = function()
    vim.opt_local.wrap = true         -- 软换行
    vim.opt_local.linebreak = true    -- 在单词边界换行
    vim.opt_local.spell = true        -- 拼写检查
    vim.opt_local.spelllang = "en_us" -- 英文拼写
    vim.opt_local.textwidth = 0       -- 不强制断行
    vim.opt_local.colorcolumn = ""    -- 去除颜色列标记
    vim.opt_local.conceallevel = 2    -- 隐藏 Markdown 标记字符
  end,
})
