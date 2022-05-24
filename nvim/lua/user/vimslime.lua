local status_ok, vimslime = pcall(require, "vim-slime")
if not status_ok then
  return
end

vimslime.setup {
  slime_target = { "neovim" },
  slime_default_config = {
    sessionname = "julia",
    windowname = "0",
  },
  slime_dont_ask_default = { 1 },
  slime_cell_delimeter = { "#%%" }
}
