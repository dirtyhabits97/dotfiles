-- source:
-- https://github.com/creativenull/diagnosticls-configs-nvim
local dlsconfig = require 'diagnosticls-configs'

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
