return {
    -- LSP
     {
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

    --Autocompletion with nvim-cmp
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },

--    'hrsh7th/nvim-cmp',          -- The completion plugin
--    'hrsh7th/cmp-buffer',        -- buffer completions
--    'hrsh7th/cmp-path',          -- path completions
--    'hrsh7th/cmp-cmdline',       -- cmdline completions
--    'saadparwaiz1/cmp_luasnip',  -- snippet completions
--    'hrsh7th/cmp-nvim-lsp',
--    'hrsh7th/cmp-nvim-lua',

    -- Use TabNine
    {
        "tzachar/cmp-tabnine",
        event = "BufRead",
        build = "./install.sh",
        dependencies = 'hrsh7th/nvim-cmp',
    },

    -- snippets
    'L3MON4D3/LuaSnip', --snippet engine
    'honza/vim-snippets',

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    -- NvimTree (File Explorer)
    "nvim-tree/nvim-web-devicons",
    {
        'kyazdani42/nvim-tree.lua',
        version = "*",
    },

    -- Surround with brackets
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({ })
        end
    },

    -- Telescope ==> Fuzzy finder
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

    'nvim-telescope/telescope-media-files.nvim',

    -- Colorschemes
    'folke/tokyonight.nvim',
    'sainnhe/gruvbox-material',

    -- Show indent lines
    'lukas-reineke/indent-blankline.nvim',

    -- Colorizer
    'NvChad/nvim-colorizer.lua',

    -- Status line
    'nvim-lualine/lualine.nvim',

    -- Bufferline
    'akinsho/bufferline.nvim',

    -- Git
    'lewis6991/gitsigns.nvim',

    -- Auto pairs
    'windwp/nvim-autopairs',
    'tpope/vim-repeat',

    -- Comments
    'numToStr/Comment.nvim',

    -- Startup
    'goolord/alpha-nvim',

    --Latex 
    'lervag/vimtex',

    -- Julia
    'JuliaEditorSupport/julia-vim',

    -- For Julia REPL
    'axvr/zepl.vim',

    -- R
    { 'jalvesaq/Nvim-R',
        branch = 'stable'
    },

    -- Quarto
    { 'quarto-dev/quarto-nvim' },
    { 'quarto-dev/quarto-vim',
        ft = 'quarto',
        dependencies = {
            'vim-pandoc/vim-pandoc-syntax',
        },
    },
    { 'jmbuhr/otter.nvim',
        config = function()
            require 'otter'.setup {
                lsp = {
                    hover = { border = "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
                }
            }
        end,
    },

    -- Markdown support for preview
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && npm install',
        ft = 'markdown',
    },

    -- Utilities
    'lewis6991/impatient.nvim', -- Improve startup time for neovim
    'akinsho/toggleterm.nvim',

   -- Trouble
    'folke/trouble.nvim'
}
