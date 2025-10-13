-- these two should be set before vim-slime loads
vim.g.slime_target = "neovim"
vim.g.slime_no_mappings = true

-- after plugin loads
-- Plugins
vim.pack.add({
	-- UI plugins
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },

	-- Treesitter and LSP configs
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },

	-- Find files/text
	{ src = "https://github.com/nvim-mini/mini.pick" },
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

    -- Code runner
    { src = "https://github.com/jpalardy/vim-slime" },
})

-- Enable LSPs
vim.lsp.enable({
    "lua_ls", "texlab", "r_language_server",
    "matlab_ls", "marksman", "pyright",
    "tinymist", "julials"
})

-- Colors
require("rose-pine").setup({
    styles = { transparency = false },
    variant = "moon",
})
vim.cmd("colorscheme rose-pine")
vim.cmd(":hi statusline guibg=NONE")

-- Options and keymaps
require("user.options")
require("user.keymaps")
require("user.clean_pack")

-- Require packages for setup (defaults)
require("mini.pick").setup()
require('mini.icons').setup()
require("mason").setup()
require("ibl").setup()
require("gitsigns").setup()
require("fidget").setup({})

-- Config tree
require("user.nvimtree")

-- Require treesitter
require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "latex", "r", "rnoweb", "yaml",
        "markdown", "matlab", "python", "typst", "julia" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

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

-- Require Julia config
require("user.lsp_julia")

-- Vim-Slime
vim.g.slime_input_pid = false
vim.g.slime_suggest_default = true
vim.g.slime_menu_config = false
vim.g.slime_neovim_ignore_unlisted = false
