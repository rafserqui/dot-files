-- Leader Key --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nerd Font
vim.g.have_nerd_font = true

-- :help options
vim.opt.clipboard = "unnamedplus" -- access system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line
vim.opt.conceallevel = 2 -- so that `` is visible in markdown files
vim.opt.mouse = "a" -- allow mouse use in neovim
vim.opt.ignorecase = true -- case insensitive search unless \C or capital in search
vim.opt.smartcase = true -- smart case
vim.opt.splitright = true -- all vertical splits go to the right
vim.opt.splitbelow = true -- all horizontal splits go below
vim.opt.breakindent = true -- enable break indent
local tabspace = 4
vim.opt.tabstop = tabspace -- insert `tabspace` spaces for a tab
vim.opt.shiftwidth = tabspace -- shifting
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.signcolumn = "yes" -- always show the sign column
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.completeopt = "menuone,noselect" -- better completion experience
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.cursorline = true -- Show line of cursor

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Highlight on yank
vim.opt.hlsearch = true
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
