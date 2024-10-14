return {
	"nvim-treesitter/nvim-treesitter",
	tag = nil,
	branch = "master",
	run = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	opts = {
		-- Add languages to be installed
		ensure_installed = {
			"r",
			"markdown",
			"markdown_inline",
			"matlab",
			"julia",
			"bash",
			"yaml",
			"lua",
			"vim",
			"query",
			"vimdoc",
			"css",
			"python",
			"latex",
		},
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
