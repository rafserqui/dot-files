local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
    return
end

local servers = {
    "cssls",
    "emmet_ls",
    "julials",
    "lua_ls",
    "marksman",
    "matlab_ls",
    "pyright",
    "r_language_server",
    "texlab",
    "typst_lsp",
    "yamlls",
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
    client.server_capabilities.document_formatting = true
end

local on_attach_qmd = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    client.server_capabilities.document_formatting = true
end

local lsp_flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 150,
}

-- Handlers
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
    { border = require 'misc.style'.border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
    { border = require 'misc.style'.border })

local cmp_nvim_lsp = require('cmp_nvim_lsp')
local util = require("lspconfig.util")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- CSS
lspconfig.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
}

-- Emmet
lspconfig.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
}

-- Lua
lspconfig.lua_ls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'quarto', 'pandoc' },
                disable = { 'trailing-space' }
            },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
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
-- NEEDS:
-- $home/.config/marksman/config.toml :
--     [core]
--     markdown.file_extensions = ["md", "markdown", "qmd"]
lspconfig.marksman.setup {
    on_attach = on_attach_qmd,
    capabilities = capabilities,
    filetypes = { 'markdown', 'quarto' },
    root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
}

-- R
lspconfig.r_language_server.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        r = { lsp = { rich_documentation = false }, },
    }
}

-- Latex
lspconfig.texlab.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
}

-- Typst
lspconfig.typst_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = { exportPdf = "onSave" }
}

-- Yaml
lspconfig.yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
}
