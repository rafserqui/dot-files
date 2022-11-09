-- Locals to shorten what I need to write to remap keys
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

-- Note that keymap is a function that calls "vim.api.nvim_set_keymap"
-- opts is a list with options for the keyman function, same as term_opts

-- Normal Mode --
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tabs --
keymap("n", "<C-t>", ":tabnew %<cr>", opts)
keymap("n", "<C-c>", ":tabclose<cr>", opts)
keymap("n", [[c-\]], ":tabonly<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Leader Key --
-- An important key that precedes other commands. In this config is mapped to be space
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- The following remap is "space e" which uses the command ":Lex 30+Enter"
keymap("n", "<leader>e", ":Lex 30<cr>", opts)
-- The <cr> stands for "carriage return" which is just the Enter key.
-- Command ":Lex" is short for ":Lexplore" or "left-hand explorer"
-- The number 30 that follows is the size of the window


-- Buffer Navigation --
-- Buffers are "kind of" like tabs, to navigate between them we can use ":bNext"
-- Here we map "Shift-l" and "Shift-h" for next and previous buffers
keymap("n", "<S-l>", ":bNext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual Mode --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Now we remap "p" so that what we yanked first stays there (subtle but useful as shown in video)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<leader>f", ":Telescope find_files hidden=true<CR>", opts)
keymap("n", "<leader>t", ":Telescope live_grep<CR>", opts)

-- Remap keys to allow for softwrapped navigations
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Map keys for Gitsigns
keymap("n", "<leader>gg", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gn", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", opts)

