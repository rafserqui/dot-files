return {
    -- An implementation of the Popup API from vim in Neovim
    'nvim-lua/popup.nvim',

    -- Useful lua functions used by lots of plugins
    'nvim-lua/plenary.nvim',

    -- LSP
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',             -- enable LSP
    'tamago324/nlsp-settings.nvim',      -- language server settings defined in json
    'jose-elias-alvarez/null-ls.nvim',   -- formatters and linters
    'ray-x/lsp_signature.nvim',          -- Show function signature
    'RRethy/vim-illuminate',

    --Autocompletion with nvim-cmp
    'hrsh7th/nvim-cmp',          -- The completion plugin
    'hrsh7th/cmp-buffer',        -- buffer completions
    'hrsh7th/cmp-path',          -- path completions
    'hrsh7th/cmp-cmdline',       -- cmdline completions
    'saadparwaiz1/cmp_luasnip',  -- snippet completions
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',

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
        build = ':TSUpdate',
    },
    'JoosepAlviste/nvim-ts-context-commentstring',
    'p00f/nvim-ts-rainbow',
    'nvim-treesitter/playground',

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
    'nvim-telescope/telescope.nvim',
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
    'lvimuser/lsp-inlayhints.nvim',

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
            require 'otter.config'.setup {
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
