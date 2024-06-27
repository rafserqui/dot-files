local api = vim.api
local keymap = vim.keymap
local dashboard = require("dashboard")

local conf = {}
conf.header = {
    "                                                       ",
    "                                                       ",
    "                                                       ",
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    "                                                       ",
    "                                                       ",
    "                                                       ",
    "                                                       ",
}

conf.center = {
    {
        icon = "󰈞  ",
        desc = "Find  File",
        action = ":Telescope find_files ignore=true",
        key = "f",
    },
    {
        icon = "󰈢  ",
        desc = "New file",
        action = ":ene",
        key = "e",
    },
    {
        icon = "  ",
        desc = "Recently opened files",
        action = ":Telescope oldfiles",
        key = "r",
    },
    {
        icon = "  ",
        desc = "Config",
        action = ":e ~/.config/nvim/init.lua",
        key = "c",
    },
    {
        icon = "  ",
        desc = "Lazy",
        action = ":Lazy",
        key = "u",
    },
    {
        icon = "󰅗  ",
        desc = "Quit",
        action = ":qa<CR>",
        key = "q",
    },
}

dashboard.setup({
    theme = 'doom',
    shortcut_type = 'number',
    config = conf
})

api.nvim_create_autocmd("FileType", {
    pattern = "dashboard",
    group = api.nvim_create_augroup("dashboard_enter", { clear = true }),
    callback = function()
        keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
        keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
    end
})
