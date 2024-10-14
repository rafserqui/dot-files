local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Jump to buffer number
keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)

-- Previous or next
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

return {
    "akinsho/bufferline.nvim",
    version = "*",
    config = function()
        require("bufferline").setup({
            options = {
                show_buffer_close_icons = false,
                show_tab_indicators = true,
                enforce_regular_tabs = true,
                max_name_length = 30,
                max_prefix_length = 30,
                separator_style = "thin",
                modified_icon = "●",
                show_close_icon = false,
                left_trunc_marker = "",
                right_trunc_marker = "",
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
            },
        })
    end
}
