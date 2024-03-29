return {
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        branch = 'main',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },

            -- Adds LSP completion capabilities
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },

            -- Adds a number of user-friendly snippets
            { 'rafamadriz/friendly-snippets' },
            { 'onsails/lspkind-nvim' },

            -- Buffer completions
            { 'hrsh7th/cmp-buffer' },

            -- Path completions
            { 'hrsh7th/cmp-path' },

            -- Pandoc references
            { 'jmbuhr/cmp-pandoc-references' },

            -- Treesitter completion
            { 'ray-x/cmp-treesitter' },

            -- Latex symbols
            { 'kdheepak/cmp-latex-symbols' },
        },
    },

    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim' ,

    -- Colorschemes
    'folke/tokyonight.nvim',
    --'sainnhe/gruvbox-material',

    -- Statusline
    'nvim-lualine/lualine.nvim',

    -- Add indentation guides even on blank lines
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    -- Highlight, edit, and navigate code
    {
        'nvim-treesitter/nvim-treesitter',
        tag = nil,
        branch = 'master',
        run = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
    },

    -- Auto pairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    -- Startup
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    };

    --Latex 
    'lervag/vimtex',

    -- R
    { 
        'jalvesaq/Nvim-R',
        branch = 'stable'
    },

    -- Quarto
    {
        'quarto-dev/quarto-nvim',
        ft = 'quarto',
        diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" }
        },
        completion = {
            enabled = true,
        },
        dependencies = {
            {
                'jmbuhr/otter.nvim',
                dependencies = {
                    { 'neovim/nvim-lspconfig' },
                },
                opts = {
                    lsp = {
                        hover = { border = require 'misc.style'.border }
                    },
                },
            },
        },
        opts = {
            lspFeatures = {
                languages = { 'r', 'python', 'julia', 'bash', 'lua' },
            },
        },
    },

    -- Markdown support for preview
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && npm install',
        ft = 'markdown',
    },

    -- Trouble
    'folke/trouble.nvim',

    -- NvimTree (File Explorer)
    {
        'nvim-tree/nvim-tree.lua',
        version = "*",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    
    -- Typst
    {
        'kaarmu/typst.vim',
        ft = 'typst',
        lazy=false,
    },

    -- Colorizer
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup {
                css = { css_fn = true, css = true },
                'javascript',
                'html',
                'r',
                'rmd',
                'qmd',
                'markdown',
                'python'
            }
        end
    },
}
