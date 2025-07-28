-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

return lazy.setup({
    { "vague2k/vague.nvim" },

    require("user.lualine"),
    require("user.treesitter"),
    require("user.blink"),
    require("user.lspconfigs"),
    require("user.nvimtree"),
    require("user.telescope"),
    require("user.nvim-r"),
    require("user.quarto"),

    -- Auto pairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    -- Code runner
    {
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
    },

    -- Typst
    {
        'chomosuke/typst-preview.nvim',
        lazy = false, -- or ft = 'typst'
        version = '1.*',
        opts = {
            dependencies_bin = {
                tinymist = "tinymist",
            },
        },
    },

    -- Git integrations
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})
        end,
    },

    -- Indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    -- Latex
    { "lervag/vimtex", lazy = false },
})
