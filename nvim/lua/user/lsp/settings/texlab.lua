return {
  config = {
		root_dir = function(fname)
			return util.root_pattern({ "main.tex", ".latexmkrc" })(fname) or vim.fn.getcwd()
		end,
		settings = {
			texlab = {
				build = {
					onSave = true,
					executable = "latexmk",
					args = { "-pdf", "-interaction=nonstopmode", "-synctex=1" },
				},
				forwardSearch = {
					executable = "zathura",
					args = { "--synctex-forward", "%l:1:%f", "%p" },
				},
			},
		},
	}
}

