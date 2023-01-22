------------------------------- Linters ------------------------------

local dlsconfig = require('diagnosticls-configs')
local util = require('lspconfig.util')

local on_attach = function(client, bufnr)
  local lsp_on_attach = require('ide.lsp').lsp_on_attach
  lsp_on_attach(client, bufnr, { disableCodeContext = true })
end

dlsconfig.init {
  on_attach = on_attach,
  root_dir = function(fname)
    return util.root_pattern '.git' (fname) or util.path.dirname(fname)
  end,
}

-- source:
-- https://github.com/creativenull/diagnosticls-configs-nvim
dlsconfig.setup {
  ['cpp'] = {
    linter = require('diagnosticls-configs.linters.cpplint')
  },
  ['lua'] = {
    linter = require('diagnosticls-configs.linters.luacheck')
  },
  ['sh'] = {
    linter = require('diagnosticls-configs.linters.shellcheck')
  },
  ['swift'] = {
    linter = {
      require('diagnosticls-configs.linters.swiftlint'),
      require('diagnosticls-configs.linters.swiftformat'),
    },
    formatter = require('diagnosticls-configs.formatters.swiftformat')
  },
  ['yaml'] = {
    linter = require('diagnosticls-configs.linters.yamllint')
  },
}
