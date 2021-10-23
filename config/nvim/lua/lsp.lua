------------------------------- LSP ------------------------------

-- source: https://github.com/neovim/nvim-lspconfig
local lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  -- Diagnostics
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  -- Method signature
  require'lsp_signature'.on_attach(client, bufnr)
end

-- Integration with autocomplete
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Swift
lspconfig.sourcekit.setup{
  serverPath = '/Applications/Xcode-System.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp',
  filetypes = {'swift'},
  capabilities = capabilities,
  on_attach = on_attach
}

-- Python
-- https://github.com/python-lsp/python-lsp-server
lspconfig.pylsp.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- Ruby
lspconfig.solargraph.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- Bash
lspconfig.bashls.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- Haskell
lspconfig.hls.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- Rust
lspconfig.rls.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- Groovy
-- source: https://github.com/prominic/groovy-language-server
-- notes: install jdk-14.0.2, it won't install with jdk-16
lspconfig.groovyls.setup{
  cmd = {
    "java",
    "-jar",
    "/Users/user/other_projects/outside/groovy-language-server/build/libs/groovy-language-server-all.jar"
  },
  capabilities = capabilities,
  on_attach = on_attach
}

-- C
lspconfig.clangd.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- Lua
-- source: https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
-- source: https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/sumneko_lua.lua
lspconfig.sumneko_lua.setup {
  cmd = {
    "/Users/user/other_projects/lsp/lua-language-server/bin/macOS/lua-language-server",
    "-E",
    "/Users/user/other_projects/lsp/lua-language-server/main.lua"
  },
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
  capabilities = capabilities,
  on_attach = on_attach
}

------------------------------- Linters ------------------------------
local dlsconfig = require 'diagnosticls-configs'
local util = require 'lspconfig.util'

dlsconfig.init {
  on_attach = on_attach,
  root_dir = function(fname)
    return util.root_pattern '.git'(fname) or util.path.dirname(fname)
  end,
}
