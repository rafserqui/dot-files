M = {}
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup({
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        theme = "ayu",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard" } },
    },
    sections = {
        lualine_a = { { "mode", icon = " " } },
        lualine_b = {
            { "branch", icon = " " },
            { "diff" },
            {
                "filename",
                icon = " ",
                path = 1
            },
        },
        lualine_c = {
            {
                "diagnostics",
                symbols = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    hint = "󰝶 ",
                },
            },
        },
        lualine_x = {},
        lualine_y = {
            {
                "location",
                icon = "  "
            },
        },
        lualine_z = {
            {
                "filetype",
                icon_only = true,
                separator = "",
                padding = { left = 1, right = 0 }
            },
        }
    }
})
