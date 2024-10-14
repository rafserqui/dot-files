return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        exclude = {
            buftypes = { "help" },
            filetypes = { "dashboard" }
        },
        whitespace = { remove_blankline_trail = false },
    }
}
