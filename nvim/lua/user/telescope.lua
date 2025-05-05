return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            -- Required dependency for lua functions
            'nvim-lua/plenary.nvim',

            -- Native fzf
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

            -- Useful for getting pretty icons, but requires a Nerd Font.
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
        },
        config = function ()
            require("telescope").setup({
                extensions = {
                    fzf = {}
                },
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "smart" },
                },
            })
            -- Enable telescope fzf native, if installed
            pcall(require('telescope').load_extension, 'fzf')
        end
    }
}
