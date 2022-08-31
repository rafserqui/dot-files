require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"

require'colorizer'.setup()

-- Persist one colorscheme
vim.cmd "colorscheme onenord" -- kanagawa if darker

require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.toggleterm"
require "user.lualine"
require "user.autocommands"
require "user.markdown-preview"
require "user.nvim-r"

