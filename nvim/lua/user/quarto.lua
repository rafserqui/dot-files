return {
    -- Quarto
    {
        "quarto-dev/quarto-nvim",
        ft = { "quarto" },
        dev = false,
        opts = {
            lspFeatures = {
                chunks = "curly",
                languages = { "r", "julia", "python", "bash", "html" },
                diagnostics = {
                    enabled = true,
                    triggers = { "BufWritePost" },
                },
                completion = {
                    enabled = true,
                },
            },
            codeRunner = {
                enabled = false,
                default_method = nil,
                never_run = { "yaml" },
            },
        },
    },

    {
        'jmbuhr/otter.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        opts = {},
    },
}
