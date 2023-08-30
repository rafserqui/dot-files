local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    -- Add languages to be installed
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "" },
    highlight = { enable = true },
    autopairs = {
        enable = true,
    },
    indent = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
            "#68a0b0",
            "#946EaD",
            "#c7aA6D",
        }
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
