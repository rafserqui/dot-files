require("user.options")
require("user.lazy")
require("user.colorscheme")
require("user.keymaps")
require("user.latex")

require("typst-preview").setup({
    dependencies_bin = {
        ['tinymist'] = 'tinymist',
    },
    -- This function will be called to determine the root of the typst project
    get_root = function(path_of_main_file)
        local root = vim.fs.root(path_of_main_file, { ".git" }) or vim.fn.expand("%:p:h")
        vim.notify("Tinymist root_dir: " .. root)
        return root
    end,
})


require("user.lsp_julia")
