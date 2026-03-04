# Copilot instructions — Neovim configuration (Lua)

Purpose: help Copilot sessions quickly understand this repository and where to find common commands, architecture, and local conventions.

---

## Quick commands (build / test / lint)
- No conventional CI/test framework or lint pipeline detected (this is a Neovim configuration repository).
- Editor/runtime commands you can invoke inside Neovim using this config:
  - Update plugins: `:UpdatePackages` or press `<leader>pu` (calls `vim.pack.update()`).
  - Remove unused plugins: press `<leader>pc` (runs `pack_clean()` and prompts to remove unused plugins via `vim.pack.del`).
  - Format current buffer: press `<leader>fb` (calls `vim.lsp.buf.format`).
  - LSP-specific user commands exposed by server modules (examples):
    - Pyright: `:LspPyrightOrganizeImports`, `:LspPyrightSetPythonPath <path>`
    - Texlab: `:LspTexlabBuild`, `:LspTexlabForward`, `:LspTexlabCancelBuild`, `:LspTexlabDependencyGraph`, `:LspTexlabCleanArtifacts`, `:LspTexlabCleanAuxiliary`, `:LspTexlabFindEnvironments`, `:LspTexlabChangeEnvironment`
    - Julia: `:LspJuliaActivateEnv [path]`

Notes: there are no top-level test/lint scripts to run outside Neovim; most operations are performed inside the editor (plugin updates, LSP commands, formatting).

---

## High-level architecture (big picture)
- Entrypoint: `init.lua` at the repository root — this file wires plugins, LSP capabilities, Treesitter, snippets, and requires the `lua/user/*` modules.
- Plugin management: plugins are declared via the builtin `vim.pack` API (e.g., `vim.pack.add`) and two lockfiles are present to pin versions:
  - `nvim-pack-lock.json` and `lazy-lock.json` (they record concrete commits/commits used by the plugin manager).
- User configuration modules: `lua/user/` contains high-level pieces:
  - `options.lua` — editor options
  - `keymaps.lua` — keybindings and user commands
  - `nvimtree.lua` — nvim-tree configuration
  - `clean_pack.lua` — helper to remove unused plugins
  - `lsp_julia.lua` — Julia LSP setup and helper command
- Per-language LSP customization: `lsp/` contains one-file-per-server modules (e.g., `pyright.lua`, `lua_ls.lua`, `texlab.lua`) that return LSP config tables (cmd, filetypes, root_markers, on_attach). `init.lua` enables/loads these servers.
- Snippets: `snippets/` holds JSON snippets; `luasnip` is configured to `lazy_load()` snippets from the runtime path and from `<stdpath('config')>/snippets`.
- Treesitter: the language list to install is explicitly set in `init.lua`.

---

## Key conventions and patterns (project-specific)
- Module loading pattern: user modules are required as `require('user.<name>')` and should live under `lua/user/`.
- LSP files in `lsp/` return an nvim-lspconfig-style table (fields: `cmd`, `filetypes`, `root_markers`, `settings`, `on_attach`) and typically create `:Lsp<Server><Action>` user commands for server-specific workflows.
- Plugin APIs: this configuration uses the builtin `vim.pack` API (e.g., `vim.pack.add`, `vim.pack.get`, `vim.pack.update`, `vim.pack.del`) rather than a purely external plugin loader. `clean_pack.lua` and `:UpdatePackages` interact with that API.
- Keymap conventions: leader is set to space (`vim.g.mapleader = ' '`); most user bindings are centralized in `lua/user/keymaps.lua` and use a local `opts` table and `vim.api.nvim_set_keymap` or `vim.keymap.set`.
- Snippets: store vscode-style JSON in `snippets/`; `luasnip` is configured to load them via `luasnip.loaders.from_vscode.lazy_load()`.
- Treesitter additions: to add languages, update the `require('nvim-treesitter').install({ ... })` call in `init.lua`.
- Lockfiles: `nvim-pack-lock.json` and `lazy-lock.json` reflect pinned plugin commits — update them when you intentionally change plugin versions.

---

## Files worth inspecting for context
- `init.lua` — single place that wires plugins, LSP, treesitter, snippets, and requires `lua/user/*`.
- `lua/user/` — primary customization surface (options/keymaps/nvimtree/clean_pack, etc.).
- `lsp/` — per-language server configurations (returns tables consumable by nvim-lspconfig).
- `snippets/` — snippet files loaded by LuaSnip.
- `nvim-pack-lock.json`, `lazy-lock.json` — plugin lockfiles.

---
