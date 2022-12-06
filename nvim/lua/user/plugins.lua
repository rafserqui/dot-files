-- These plugins are managed with Packer
-- Start with the locals
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim/"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Have packer manage itself
  use "wbthomason/packer.nvim"

  -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/popup.nvim"

  -- Useful lua functions used by lots of plugins
  use "nvim-lua/plenary.nvim"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json
  use "jose-elias-alvarez/null-ls.nvim" -- formatters and linters
  use "ray-x/lsp_signature.nvim" -- Show function signature
  use "RRethy/vim-illuminate"

	--Autocompletion with nvim-cmp
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "honza/vim-snippets"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"

  -- NvimTree
  use 'kyazdani42/nvim-tree.lua'

  -- Surround with brackets
  use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  })

  -- Telescope ==> Fuzzy finder
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Colorschemes
--  use "rebelot/kanagawa.nvim"
--  use 'rmehri01/onenord.nvim'
  -- use "aymenhafeez/neodark.nvim"
  -- use "lunarvim/horizon.nvim"
  -- use {
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  -- }
  use 'folke/tokyonight.nvim'

  -- Colorizer
  use "NvChad/nvim-colorizer.lua"

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- Status line
  use "nvim-lualine/lualine.nvim"

  -- Bufferline
  use "akinsho/bufferline.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

	-- Auto pairs
	use "windwp/nvim-autopairs"
	use "tpope/vim-repeat"

  -- Comments
  use "numToStr/Comment.nvim"
  use "lvimuser/lsp-inlayhints.nvim"

  -- Startup
  use "goolord/alpha-nvim"

	--Latex 
  use "lervag/vimtex"

  -- Julia
  -- use "JuliaEditorSupport/julia-vim"

  -- R
  use {"jalvesaq/Nvim-R", branch = "stable" }

  -- Markdown support for preview
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }

  -- Utilities
  use "lewis6991/impatient.nvim" -- Improve startup time for neovim
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  -- Automatically set up your configuration after cloning pacer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
