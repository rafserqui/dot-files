-- LSP communicate between editor and languagelspconf
-- This is useful for errors, definitions...
-- Editor is the client, server is the language

-- Mason settings
local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}
return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs
            { "williamboman/mason.nvim", config = true },
            { "williamboman/mason-lspconfig.nvim" },
            { "WhoIsSethDaniel/mason-tool-installer.nvim" },

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },
        },
        config = function()
            require("lspconfig").lua_ls.setup {}

            -- Setup servers we want Mason to install
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))
            local servers = {
				texlab = {},
				r_language_server = {},
                julials = {},
				matlab_ls = {
					settings = {
						matlab = {
							indexWorkspace = true,
							installPath = "/usr/local/bin",
							matlabConnectionTiming = "onStart",
							telemetry = false,
						},
					},
                    single_file_support = true,
                },
                marksman = {
                    filetypes = { "markdown", "quarto" },
                    root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", "_quarto.yml"),
                },
                pyright = {},
                lua_ls = {
                    settings = { Lua = { telemetry = { enable = false } } }
                },
            }

            -- Ensure the servers and tools above are installed
            --  To check the current status of installed tools and/or manually install
            --  other tools, you can run
            --    :Mason
            --
            --  You can press `g?` for help in this menu.
            require("mason").setup(settings)

            -- Ensure Mason installs the LSPs
            local ensure_installed = vim.tbl_keys(servers or {})
            require("mason-tool-installer").setup({
                ensure_installed = ensure_installed
            })

            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end,
    },
}
