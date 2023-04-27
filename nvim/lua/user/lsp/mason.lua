local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
    return
end

local servers = {
    "lua_ls",
    "emmet_ls",
    "cssls",
    "jdtls",
    "pyright",
    "julials",
    "texlab",
    "r_language_server",
    "marksman",
    "tsserver",
}

local settings = {
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

for _, server in pairs(servers) do
    lspconfig[server].setup{}
end

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
    client.server_capabilities.document_formatting = true
end

local on_attach2 = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
    buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
    client.server_capabilities.document_formatting = true
end

local lsp_flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 150,
}

local cmp_nvim_lsp = require('cmp_nvim_lsp')
local util = require("lspconfig.util")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Lua
lspconfig.lua_ls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim', 'quarto' } },
            disable = { 'trailing-space' },
        }
    }
}

-- Julia
lspconfig.julials.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}

-- Markdown
lspconfig.marksman.setup {
    on_attach = on_attach2,
    capabilities = capabilities,
    filetypes = { 'markdown', 'quarto', 'qmd' },
    root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml")
}

-- R
lspconfig.r_language_server.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
}

lspconfig.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
}

lspconfig.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
}

-- Typst
lspconfig.typst_lsp.setup{ filetypes = { "typst", "sql" } }
