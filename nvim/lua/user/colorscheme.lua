-- local colorscheme = "onedark" -- "tokyonight-moon" "tokyonight-day" "gruvbox-material"
-- local colorscheme = "neofusion"
-- local colorscheme = "ayu-mirage"
local colorscheme = "rose-pine-moon"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
