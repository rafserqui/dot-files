local colorscheme = "tokyonight-moon"
--local colorscheme = "gruvbox-material"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

-- Config gruvbox
--vim.o.background = "dark"
--vim.g.gruvbox_material_background = "hard"
--vim.g.gruvbox_material_better_performance = 1

-- Set up transparency
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
