-- Locals to shorten what I need to write to remap keys
local opts = { noremap = true, silent = true }

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

-- Buffer Navigation --
-- Buffers are "kind of" like tabs, to navigate between them we can use ":bNext"
-- Here we map "Shift-l" and "Shift-h" for next and previous buffers
keymap("n", "<S-l>", ":bNext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual Mode --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selection up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Now we remap "p" so that what we yanked first stays there
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal navigation ---
keymap("t", "<esc>", "<C-\\><C-n>", opts)
keymap("n", "<C-\\>", ":terminal<CR>a", opts)

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files ignore=false<CR>", opts)
keymap("n", "<leader>tt", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fg", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>bb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Remap keys to allow for softwrapped navigations
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Map keys for Gitsigns
keymap("n", "<leader>gg", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gf", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gu", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>gbu", ":Gitsigns reset_buffer<CR>", opts)

-- Map keys for diagnostics
keymap("n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>ww", ":lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<space>q", ":lua vim.diagnostic.setloclist()<CR>", opts)

-- Quarto Preview
keymap("n", "<leader>qq", ":QuartoPreview<CR>", opts)
keymap("n", "<leader>qc", ":QuartoClosePreview<CR>", opts)

-- Typst view pdf
keymap("n", "<leader>lt", ":TypstWatch<CR>", opts)

-- Hide highlight after search
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Start Julia REPL
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

local job_id = 0
vim.keymap.set("n", "<space>js", function()
    vim.cmd.vnew()
    vim.cmd.term("julia")
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)

    job_id = vim.bo.channel
end)
