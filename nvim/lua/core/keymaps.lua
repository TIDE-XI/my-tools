vim.g.mapleader = " "
local keymap= vim.keymap
--插入模式--
keymap.set("i","ii","<Esc>")
--正常模式--
--窗口--
keymap.set("n","<leader>sv","<C-w>v")--水平新增窗口
keymap.set("n","<leader>sh","<C-w>s")--垂直新增窗口

--取消高亮
keymap.set("n","<leader>;",":nohl<CR>")

--粘贴剪贴板图片 → GitHub 图床（异步，不阻塞）
vim.api.nvim_create_user_command("PasteImg", function()
  local tmp = os.tmpname() .. ".png"
  local script = vim.fn.stdpath("config"):gsub("\\", "/") .. "/lua/core/upload.ps1"
  vim.notify("正在上传...", vim.log.levels.INFO)
  vim.fn.jobstart(
    string.format('powershell -NoProfile -File "%s" "%s"', script, tmp:gsub("/", "\\")),
    {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if not data then return end
        local out = table.concat(data, "")
        local url = out:match("(https?://[^\n\r]+)")
        vim.schedule(function()
          if url then
            vim.api.nvim_put({ "![](" .. url .. ")" }, "c", true, true)
            vim.notify("上传成功!", vim.log.levels.INFO)
          elseif out:match("CLIP_FAIL") then
            vim.notify("剪贴板中没有图片", vim.log.levels.WARN)
          else
            vim.notify("上传失败", vim.log.levels.ERROR)
          end
        end)
      end,
    }
  )
end, {})

keymap.set("n", "<leader>p", "<cmd>PasteImg<CR>", { desc = "粘贴图片到图床" })

