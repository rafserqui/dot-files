-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'
lspkind.init()

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-2),
        ['<C-f>'] = cmp.mapping.scroll_docs(2),
        ['<C-n>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
                fallback()
            end
        end, { "i", "s" }),
        ['<C-p>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    autocomplete = true,
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                otter = "[🦦]",
                luasnip = "[snip]",
                nvim_lsp = "[LSP]",
                buffer = "[buf]",
                path = "[path]",
                spell = "[spell]",
                pandoc_references = "[ref]",
                tags = "[tag]",
                treesitter = "[TS]",
                calc = "[calc]",
                latex_symbols = "[tex]",
                emoji = "[emoji]",
            },
        },
    },
    sources = {
        { name = 'otter' }, -- for code chunks in quarto
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip',                keyword_length = 3, max_item_count = 3 },
        { name = 'pandoc_references' },
        { name = 'buffer',                 keyword_length = 5, max_item_count = 3 },
        { name = 'spell' },
        { name = 'treesitter',             keyword_length = 5, max_item_count = 3 },
        { name = 'calc' },
        { name = 'latex_symbols' },
        { name = 'emoji' },
    },
    view = { entries = "native", },
    window = {
        documentation = { border = require 'misc.style'.border, },
    },
}

-- Friendly snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- for custom snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snips" } })
luasnip.config.setup {}

-- Link quarto and rmarkdown to markdown snippets
luasnip.filetype_extend("quarto", { "markdown" })
