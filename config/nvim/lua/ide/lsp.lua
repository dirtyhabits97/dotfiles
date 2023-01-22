------------------------------- LSP ------------------------------

-- source: https://github.com/neovim/nvim-lspconfig
local lspconfig = require('lspconfig')

--- The method that gets called when the language-server is attached
-- @param client the client to which the language-server will attach
-- @param bufnr the buffer
-- @param mainOpts disableCodeContext disables nvim-navic context helper
local on_attach = function(client, bufnr, mainOpts)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  -- Diagnostics
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  -- for some reason client.server_capabilities.document_formatting was not working, this fixes it
  if client.supports_method('textDocument/formatting') then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
  elseif client.supports_method('textDocument/rangeFormatting') then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server capabilities
  -- Use supports_method instead, source:
  -- https://github.com/rafi/vim-config/commit/5ee2e8d8635afb68db5cdb2259f53926494b8478
  if client.supports_method('textDocument/documentHighlight') then
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
  require 'lsp_signature'.on_attach(client, bufnr)

  -- Show code context
  if mainOpts == nil or mainOpts.disableCodeContext == false then
    local navic = require("nvim-navic")
    navic.attach(client, bufnr)
  end
end

-- Integration with autocomplete
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Swift
lspconfig.sourcekit.setup {
  filetypes = { 'swift' },
  capabilities = capabilities,
  on_attach = on_attach
}

-- Python
-- https://github.com/python-lsp/python-lsp-server
-- pip install 'python-language-server[all]'
lspconfig.pylsp.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- Ruby
lspconfig.solargraph.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- Bash
lspconfig.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- Haskell
lspconfig.hls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- Rust
lspconfig.rls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- Groovy
-- source: https://github.com/prominic/groovy-language-server
-- notes: install jdk-14.0.2, it won't install with jdk-16
lspconfig.groovyls.setup {
  cmd = {
    "java",
    "-jar",
    "/Users/user/other_projects/outside/groovy-language-server/build/libs/groovy-language-server-all.jar"
  },
  capabilities = capabilities,
  on_attach = on_attach
}

-- C
lspconfig.clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- Lua
lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
    },
  },
  capabilities = capabilities,
  on_attach = on_attach
}

-- javascript
-- install: npm install -g typescript typescript-language-serve
lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- Expose the on_attach method for other uses
-- (e.g. linters)
return {
  lsp_on_attach = on_attach
}