local dlsconfig = require 'diagnosticls-configs'
local cpplint = require 'diagnosticls-configs.linters.cpplint'
local shellcheck = require 'diagnosticls-configs.linters.shellcheck'
local swiftlint = require 'diagnosticls-configs.linters.swiftlint'

dlsconfig.setup {
  ['cpp'] = {
    linter = cpplint
  },
  ['sh'] = {
    linter = shellcheck
  },
  ['swift'] = {
    linter = swiftlint
  },
}
