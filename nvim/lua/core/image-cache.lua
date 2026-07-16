-- 后台预缓存远程图片，加速 <leader>mp 浏览器加载
local M = {}
local cache_dir = vim.fn.stdpath("cache") .. "/img_cache"
vim.fn.mkdir(cache_dir, "p")

local function url_to_name(url)
  return url:match("/([^/]+%.%w+)$") or (url:match("/([^/]+)$") or "img") .. ".png"
end

function M.cache_all()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  for _, line in ipairs(lines) do
    local url = line:match("!%[.-%]%((https?://[^%)]+)%)")
    if url then
      local local_path = cache_dir .. "/" .. url_to_name(url)
      vim.fn.jobstart({ "curl", "-s", "--socks5-hostname", "127.0.0.1:10808", "-o", local_path, url })
    end
  end
end

vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "*.md" },
  callback = function() vim.schedule(M.cache_all) end,
})

return M
