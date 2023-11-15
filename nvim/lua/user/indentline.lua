local status_ok, indentline = pcall(require, "ibl")
if not status_ok then
    return
end

indentline.setup {
    exclude = { buftypes = { "help" }},
    whitespace = { remove_blankline_trail = false },
    -- indent = { char = '┊' },
}
