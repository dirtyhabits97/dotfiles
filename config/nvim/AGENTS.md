# AGENTS.md - Neovim Configuration

This is a personal Neovim configuration written in Lua. It uses lazy.nvim for
plugin management with lazy-loading for fast startup.

## Project Structure

```
nvim/
├── init.lua              # Entry point - loads core module
├── lazy-lock.json        # Plugin version lock file
├── .luacheckrc           # Lua linting configuration
└── lua/
    ├── core/             # Core configuration (always loaded)
    │   ├── init.lua      # Bootstraps all core modules
    │   ├── plugins.lua   # Plugin definitions (lazy.nvim)
    │   ├── set.lua       # Vim options/settings
    │   ├── mappings.lua  # Key mappings
    │   └── color.lua     # Colorscheme setup
    ├── ide/              # IDE features (lazy-loaded by plugins)
    │   ├── lsp.lua       # LSP server configurations
    │   ├── completion.lua # nvim-cmp setup
    │   ├── treesitter.lua # Syntax highlighting
    │   ├── telescope.lua  # Fuzzy finder
    │   └── ...
    └── ui/               # UI enhancements (lazy-loaded)
        └── ...
```

## Build/Lint/Test Commands

This is a configuration repository, not a library. There is no formal build system.

### Linting

```bash
# Lint all Lua files with luacheck
luacheck lua/

# Lint a single file
luacheck lua/core/plugins.lua
```

The `.luacheckrc` file defines `vim` as a global to suppress undefined-global warnings.

### Validation

```vim
" Check for errors after loading config
:checkhealth

" Sync plugins and check for issues
:Lazy sync
:Lazy health

" Check LSP status
:LspInfo

" Check treesitter parsers
:TSInstallInfo
```

### Testing Changes

1. Make your changes to the Lua files
2. Reload Neovim or source the file: `:source %`
3. For plugin changes, run `:Lazy sync`
4. Check `:messages` for any errors

## Code Style Guidelines

### Indentation and Formatting

- Use 2 spaces for indentation (no tabs)
- Maximum line length: ~100 characters (soft limit)
- Use trailing commas in multi-line tables

### Strings and Quotes

- Use single quotes for `require()` calls: `require('core.plugins')`
- Use single quotes for most string literals
- Use double quotes when the string contains single quotes
- Use double brackets for Vim command strings: `[[:NvimTreeToggle<cr>]]`

### Comments and Documentation

- Use dashed section headers for major sections:
  ```lua
  ------------------------------- Section Name ------------------------------
  ```
- Include source URLs for reference:
  ```lua
  -- source: https://github.com/user/repo
  ```
- Use `@param` style for function documentation

### Variable Declarations

- Always use `local` for variables and functions
- Align related assignments for readability:
  ```lua
  set.tabstop     = 2
  set.shiftwidth  = 2
  set.softtabstop = 2
  ```

### Module Pattern

- Define helper functions at the top of files
- Export shared functions via module returns:
  ```lua
  return { lsp_on_attach = on_attach }
  ```

### Safe Loading

- Use `pcall` for optional plugins:
  ```lua
  local ok, module = pcall(require, 'optional-plugin')
  if ok then module.setup({}) end
  ```

### Keymap Style

- Use helper functions for simple mappings:
  ```lua
  nnoremap('<leader>ff', [[:Telescope find_files<cr>]])
  ```
- Use `vim.keymap.set` for mappings with callbacks

## Plugin Configuration

### Adding a New Plugin

Add the plugin spec to `lua/core/plugins.lua`:

```lua
{
  'author/plugin-name',
  event = 'BufReadPost',  -- lazy-load trigger
  dependencies = { 'dependency/plugin' },
  config = function() require('ide.plugin_config') end
},
```

Then create the config file (e.g., `lua/ide/plugin_config.lua`).

### Lazy Loading Events

- `BufReadPre` / `BufReadPost` - When opening a file
- `InsertEnter` - When entering insert mode
- `VeryLazy` - After startup
- `LspAttach` - When LSP attaches to buffer
- `cmd = { 'Command' }` - On specific command
- `ft = 'filetype'` - For specific filetypes

## LSP Configuration

LSP servers are configured in `lua/ide/lsp.lua`. To add a new server:

```lua
lspconfig('server_name', {
  capabilities = capabilities,
  on_attach = on_attach
})
vim.lsp.enable('server_name')
```

### Configured LSP Servers

- sourcekit (Swift), pylsp (Python), solargraph (Ruby)
- bashls (Bash), lua_ls (Lua), ts_ls (TypeScript/JavaScript)
- rust_analyzer (Rust), clangd (C/C++), groovyls (Groovy)
- hsl (Haskell), buf_ls (Protobuf)

## Key Bindings

- Leader key: `<Space>`
- File explorer: `<C-n>` toggle, `<C-m>` find file
- Telescope: `<leader>f` prefix (ff=files, fg=grep, fb=buffers, fd=diagnostics)
- LSP: `gd`=definition, `gr`=references, `K`=hover, `<leader>rn`=rename
- Git: `<leader>gb`=blame, `<leader>gp`=preview hunk
- Diagnostics: `[d`/`]d`=prev/next, `<leader>l`=toggle lsp_lines

## Common Patterns

### Vim Options

Set options in `lua/core/set.lua` using `vim.opt`:

```lua
local set = vim.opt
set.number = true
```

### Autocommands

Use `vim.api.nvim_create_autocmd` or `vim.cmd` with heredoc:

```lua
vim.cmd [[
  au BufRead,BufNewFile Podfile setfiletype ruby
]]
```

### User Commands

```lua
vim.api.nvim_create_user_command('CommandName', function()
  -- implementation
end, { nargs = 0 })
```
