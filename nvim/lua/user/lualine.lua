M = {}
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width
}

local mode = {
    -- mode component
    "mode",
    fmt = function(str)
        -- return "▊"
        return "  " .. str .. " "
        -- return "  "
    end,
    padding = 0,
}

local filetype = {
    "filetype",
    icon_only = true,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local location = {
    "location",
    padding = 0,
}

local filename = {
    "filename",
    path = 0,
}

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "ayu"
    }
})
