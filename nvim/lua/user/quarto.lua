return {
    {
        "quarto-dev/quarto-nvim",
        dev = false,
        dependencies = {
            "jmbuhr/otter.nvim",
        },
        ft = "quarto",
        config = function ()
            require("quarto").setup({
                lspFeatures = {
                    enabled = true,
                    languages = { "r", "python", "julia", "bash", "html" },
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWritePost" },
                    },
                    completion = { enabled = true },
                },
            })
        end
    },
}
