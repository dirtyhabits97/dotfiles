------------------------------- Linters ------------------------------
-- setup
local dlsconfig = require('diagnosticls-configs')
local on_attach = require('core.lsp').core_on_attach
local util = require('lspconfig.util')

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
}
