return {
	"OXY2DEV/markview.nvim",
	lazy = false, -- Recommended
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local presets = require("markview.presets")
		local mkview = require("markview")
		mkview.setup({
			headings = presets.headings.glow,
			checkboxes = presets.checkboxes.legazy,
			horizontal_rules = presets.horizontal_rules.thin,
			latex = { enable = true },
		})
	end,
}
