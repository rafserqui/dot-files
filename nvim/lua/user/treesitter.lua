-- Treesitter --- Fancy syntax highlighting per language
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    main = "nvim-treesitter.configs",
	opts = {
		-- Add languages to be installed
		ensure_installed = {
			"latex", "julia", "r", "rnoweb",
			"matlab", "csv", "markdown",
			"markdown_inline", "python", "lua",
			"bash", "yaml", "vim", "query",
			"vimdoc", "css",
		},
        auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		autopairs = { enable = true },
		indent = { enable = true },
		rainbow = {
			enable = true,
			extended_mode = true,
		},
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
			},
			move = {
				enable = true,
				set_jumps = true,
			},
		},
	},
}
