return {
    "jpalardy/vim-slime",
    init = function()
        -- these two should be set before the plugin loads
        vim.g.slime_target = "neovim"
        vim.g.slime_no_mappings = true
    end,
    config = function()
        vim.g.slime_input_pid = false
        vim.g.slime_suggest_default = true
        vim.g.slime_menu_config = false
        vim.g.slime_neovim_ignore_unlisted = false

        -- called MotionSend but works with textobjects as well
        vim.keymap.set("v", "<leader>ss", "<Plug>SlimeRegionSend", { remap = true, silent = false })
    end,
}
