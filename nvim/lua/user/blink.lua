return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
            ['<CR>'] = { 'accept', 'fallback' },

            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
        },
        appearance = { nerd_font_variant = 'mono' },
        completion = {
            documentation = { auto_show = false },
            list = { selection = { preselect = false } },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        -- No completions in the command line given by blink
        cmdline = { enabled = false },
    },
    opts_extend = { "sources.default" }
}
