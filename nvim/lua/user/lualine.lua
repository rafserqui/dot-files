return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require("lualine").setup({
            options = {
                theme = "ayu",
                globalstatus = true,
            },
            sections = {
                lualine_a = { { "mode", icon = " " } },
                lualine_b = {
                    { "branch", icon = " " },
                    { "diff" },
                    {
                        "filename",
                        icon = " ",
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
            }
        })
    end
}
