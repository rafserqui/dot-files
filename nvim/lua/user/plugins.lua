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

	--Latex plugin for compilation and more
	use "lervag/vimtex"

	--Autocompletion with nvim-cmp
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Buffer line to see buffers open and a terminal
  use {"akinsho/bufferline.nvim", tag = "v2.*"}
  use "moll/vim-bbye"
  use {"akinsho/toggleterm.nvim", tag = "v1.*"}

  -- NvimTree
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "honza/vim-snippets"

	-- Auto pairs and surround for "(" "[" "{" etc.
	use "windwp/nvim-autopairs"
	use "tpope/vim-repeat"

  -- Comments
  use "numToStr/Comment.nvim"

  -- Colorschemes
  use "Shatur/neovim-ayu"

  -- For a lower bar with info
  use "itchyny/lightline.vim"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Telescope ==> Fuzzy finder
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Julia Support
  use "JuliaEditorSupport/julia-vim"
  use "jpalardy/vim-slime"

  -- Automatically set up your configuration after cloning pacer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
