--local colorscheme = "neodark"
--local colorscheme = "onenord"
--local colorscheme = "darkplus"
--local colorscheme = "horizon"
local colorscheme = "catppuccin-frappe"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
  return
end
