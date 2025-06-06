-- Leader Key --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nerd Font
vim.g.have_nerd_font = true

-- Relative numbers in lines?
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines

-- Do not show the mode because it goes in the statusline
vim.opt.showmode = true

-- Clipboard synced between OS and nvim
vim.opt.clipboard = "unnamedplus"

-- Break indents and tab spaces
vim.opt.breakindent = true -- enable break indent
local tabspace = 4
vim.opt.tabstop = tabspace -- insert `tabspace` spaces for a tab
vim.opt.shiftwidth = tabspace -- shifting
vim.opt.expandtab = true -- convert tabs to spaces

-- Case-insensitive search unless \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- How splits work
vim.opt.splitright = true -- all vertical splits go to the right
vim.opt.splitbelow = true -- all horizontal splits go below

-- Always show the sign column
vim.opt.signcolumn = "yes"

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

vim.opt.cmdheight = 2 -- more space in the neovim command line
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.mouse = "a" -- allow mouse use in neovim
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.completeopt = "menuone,noselect" -- better completion experience
vim.opt.cursorline = true -- Show line of cursor
vim.api.nvim_create_autocmd("ExitPre", {
	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
	command = "set guicursor=a:ver90",
	desc = "Set cursor back to beam when leaving Neovim.",
})

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

-- Disable netrw (advised for NvimTree)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
