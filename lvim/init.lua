-- Plugins
vim.pack.add({
	-- UI plugins
	-- { src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },

	-- Treesitter and LSP configs
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },

	-- Find files/text
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },

	-- Language specific plugins
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/lervag/vimtex" },
	{ src = "https://github.com/R-nvim/R.nvim" },

	-- Completion
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/folke/lazydev.nvim" },

	-- Git
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

-- Enable LSPs
vim.lsp.enable({
    "lua_ls", "texlab", "r_language_server",
    "matlab_ls", "marksman", "pyright",
    "tinymist", "julials"
})

-- Colors
-- require "vague".setup({ transparent = false })
-- vim.cmd("colorscheme vague")

-- Configure before setting up the color scheme
require("rose-pine").setup({
    styles = { transparency = false },
    variant = "moon",
})
vim.cmd("colorscheme rose-pine")
vim.cmd(":hi statusline guibg=NONE")

-- Options and keymaps
require("user.options")
require("user.keymaps")

-- Require packages for setup (defaults)
require("mini.pick").setup()
require("mason").setup()
require("ibl").setup()
require("gitsigns").setup()

-- Config completion
require('luasnip.loaders.from_vscode').lazy_load()
require('blink.cmp').setup({
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
        menu = {
            draw = {
                columns = {
                    { "label", "label_description", gap = 5 },
                    { "kind_icon", "kind", gap = 1 }
                },
            }
        }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
            lazydev = {
                module = 'lazydev.integrations.blink',
                score_offset = 100
            },
        },
    },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = "lua" },

    -- No completions in the command line given by blink
    cmdline = { enabled = false },

    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
})

-- Config Nvim-Tree
require("user.nvimtree")

-- Config R
require("r").setup({
    rconsole_width = 0,
    disable_cmds = {
        "RSendFunction",
        "RESendFunction",
        "RDSendFunction",
        "RSendMBlock",
        "RESendMBlock",
        "RDSendMBlock",
        "REDSendMBlock",
    },
})
