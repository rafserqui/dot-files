local status_ok, indentline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

indentline.setup {
    char = '┊',
    show_trailing_blankline_indent = true,
    show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = true,
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
        "help",
        "NvimTree",
    },
}
