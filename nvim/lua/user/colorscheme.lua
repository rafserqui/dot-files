-- local colorscheme = "kanagawa-wave"
local colorscheme = "ayu-dark"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

require("ayu").setup({
	mirage = true,
	terminal = true,
	overrides = {},
})
