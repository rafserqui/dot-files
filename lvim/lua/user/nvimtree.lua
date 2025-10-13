local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- Mappings migrated from view.mappings.list
	vim.keymap.set("n", "a", api.fs.create, opts("Create"))
	vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
end

local icons = require("mini.icons")

require("nvim-tree").setup({
    on_attach = on_attach,
    hijack_directories = {
        enable = false,
    },
    update_cwd = true,
    renderer = {
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            glyphs = {
                default = icons.get("file", "default"),
                symlink = icons.get("file", "symlink"),
                folder = {
                    default      = icons.get("directory", "default"),
                    open         = icons.get("directory", "open"),
                    empty        = icons.get("directory", "empty"),
                    empty_open   = icons.get("directory", "empty_open"),
                    symlink      = icons.get("directory", "symlink"),
                    symlink_open = icons.get("directory", "symlink_open"),
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        highlight_opened_files = "none",
        root_folder_label = false,
        root_folder_modifier = ":t",
    },
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
    },
})
