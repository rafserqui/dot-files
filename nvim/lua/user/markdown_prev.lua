M = {}
local status_ok, _ = pcall(require, "markdown-preview.nvim")
if not status_ok then
    return
end

vim.g["mkdp_auto_close"] = 0
