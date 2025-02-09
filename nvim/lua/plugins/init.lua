return {
	-- NOTE: This is where your plugins related to LSP can be installed.
	{
		{
			-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
			-- used for completion, annotations and signatures of Neovim apis
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					-- Load luvit types when the `vim.uv` word is found
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "Bilal2453/luvit-meta", lazy = true },

		-- LSP Configuration & Plugins
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				-- Automatically install LSPs to stdpath for neovim
				{ "williamboman/mason.nvim", config = true },
				"williamboman/mason-lspconfig.nvim",

				-- Useful status updates for LSP
				-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
				{ "j-hui/fidget.nvim", opts = {} },
			},
		},
	},

	-- Autocompletion
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"hrsh7th/nvim-cmp",
		branch = "main",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			{ "saadparwaiz1/cmp_luasnip" },

			-- Adds LSP completion capabilities
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },

			-- Adds a number of user-friendly snippets
			{ "rafamadriz/friendly-snippets" },
			{ "onsails/lspkind-nvim" },

			-- Path completions
			{ "hrsh7th/cmp-path" },

			-- Latex symbols
			{ "kdheepak/cmp-latex-symbols" },

			-- References for pandoc (Quarto)
			{ "jmbuhr/cmp-pandoc-references" },

			-- Buffers and paths
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
		},
	},

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	{ "lewis6991/gitsigns.nvim" },

	-- Colorschemes
	{ "rebelot/kanagawa.nvim", lazy = false },
	-- { "Shatur/neovim-ayu" },
	-- { "diegoulloao/neofusion.nvim", priority = 1000, config = true },

	-- Statusline
	{ "nvim-lualine/lualine.nvim" },

	-- Add indentation guides even on blank lines
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed.
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
	},

	-- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		tag = nil,
		branch = "master",
		run = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		-- Optional dependency
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({})
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- Trouble
	{
		"folke/trouble.nvim",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
		},
		opts = {},
	},

	-- Nvim-Tree
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
	},

	--Latex
	{
		"lervag/vimtex",
		lazy = false,
	},

	-- R
	{
		"R-nvim/R.nvim",
		lazy = false,
		ft = { "r" },
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
	},

	{ -- Autoformat
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>=",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true, r = true, julia = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},

	-- Startup
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	-- Quarto
	{
		"quarto-dev/quarto-nvim",
		ft = { "quarto" },
		dev = false,
		opts = {
			lspFeatures = {
				chunks = "curly",
				languages = { "r", "julia", "python", "bash", "html" },
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" },
				},
				completion = {
					enabled = true,
				},
			},
			codeRunner = {
				enabled = false,
				default_method = nil,
				never_run = { "yaml" },
			},
		},
	},

	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
}
