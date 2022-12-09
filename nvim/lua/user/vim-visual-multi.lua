-- https://github.com/mg979/vim-visual-multi
-- local api = require("utils.api")

local M = {}

M._viml = true

--function M.before()
--    M.register_key()
--end

function M.load()
    vim.g.VM_default_mappings = 0

    vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
        ["Find Subword Under"] = "<C-n>",
        ["I BS"] = '', -- disable backspace mapping
    }
end

function M.after() end

-- function M.register_key()
--     api.map.bulk_register({
--         {
--             mode = { "n" },
--             lhs = "<m-p>",
--             rhs = ":call vm#commands#add_cursor_up(0, v:count1)<cr>",
--             options = { silent = true },
--             description = "Create cursor down",
--         },
--         {
--             mode = { "n" },
--             lhs = "<m-n>",
--             rhs = ":call vm#commands#add_cursor_down(0, v:count1)<cr>",
--             options = { silent = true },
--             description = "Create cursor up",
--         },
--     })
-- end

return M
