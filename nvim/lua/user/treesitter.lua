local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	-- Add languages to be installed
	ensure_installed = {
		"r",
		"markdown",
		"markdown_inline",
		"julia",
		"bash",
		"yaml",
		"lua",
		"vim",
		"query",
		"vimdoc",
		"css",
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
		colors = {
			"#68a0b0",
			"#946EaD",
			"#c7aA6D",
		},
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
})
