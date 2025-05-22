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

-- Install your plugins here
return lazy.setup({
	--{ "Shatur/neovim-ayu" },
    {"rose-pine/neovim", name = "rose-pine"},

    require("user.lualine"),
    require("user.treesitter"),
    require("user.blink"),
    require("user.lspconfig"),
	require("user.nvimtree"),
    require("user.telescope"),
	require("user.nvim-r"),
    require("user.gitsigns"),
    require("user.quarto"),
    require("user.coderunner"),

	-- Latex
	{ "lervag/vimtex", lazy = false },

    -- Support for Julia
    { "JuliaEditorSupport/julia-vim" },
})
