local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local servers = {
  "sumneko_lua",
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

-- Lua 
lspconfig.sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } }
    }
  }
}


