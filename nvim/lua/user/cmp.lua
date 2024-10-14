return {
    {
        "hrsh7th/nvim-cmp",
        branch = "main",
        event = "InsertEnter",
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            {
                "L3MON4D3/LuaSnip",
                build = (function()
                    if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                        return
                    end
                    return "make install_jsregexp"
                end)(),
                config = function()
                    -- Friendly snippets
                    require("luasnip.loaders.from_vscode").lazy_load()

                    -- for custom snippets
                    require("luasnip.loaders.from_vscode").lazy_load({
                        paths = { vim.fn.stdpath("config") .. "/snips" },
                    })
                end,
            },
            { "saadparwaiz1/cmp_luasnip" },

            -- Adds LSP completion capabilities
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },

            -- Adds a number of user-friendly snippets
            { "rafamadriz/friendly-snippets", },
            { "onsails/lspkind-nvim" },

            -- Path completions
            { "hrsh7th/cmp-path" },

            -- Latex symbols
            { "kdheepak/cmp-latex-symbols" },

            -- References for pandoc (Quarto)
            { "jmbuhr/cmp-pandoc-references" },

            -- Buffers and paths
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
        },

        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            lspkind.init()

            local luasnip = require("luasnip")
            luasnip.config.setup({})
            -- Link quarto and rmarkdown to markdown snippets
            luasnip.filetype_extend("quarto", { "markdown" })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-2),
                    ["<C-f>"] = cmp.mapping.scroll_docs(2),
                    ["<C-n>"] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-p>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-e>"] = cmp.mapping.abort(),
                    -- Accept currently selected item. If none selected, `select` first item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                autocomplete = true,
                formatting = {
                    format = lspkind.cmp_format({
                        with_text = true,
                        menu = {
                            luasnip = "[snip]",
                            nvim_lsp = "[LSP]",
                            buffer = "[buf]",
                            path = "[path]",
                            spell = "[spell]",
                            pandoc_references = "[ref]",
                            tags = "[tag]",
                            treesitter = "[TS]",
                            latex_symbols = "[tex]",
                        },
                    }),
                },
                sources = {
                    { name = "lazydev", group_index = 0 },
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "luasnip", keyword_length = 3, max_item_count = 3 },
                    { name = "pandoc_references" },
                    { name = "buffer", keyword_length = 5, max_item_count = 3 },
                    { name = "spell" },
                    { name = "treesitter", keyword_length = 5, max_item_count = 3 },
                    { name = "calc" },
                    { name = "latex_symbols" },
                },
                view = { entries = "native" },
                window = {
                    documentation = { border = require("misc.style").border },
                },
            })
        end,
    },
}
