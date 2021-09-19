local dlsconfig = require 'diagnosticls-configs'
local shellcheck = require 'diagnosticls-configs.linters.shellcheck'
local swiftlint = require 'diagnosticls-configs.linters.swiftlint'

dlsconfig.setup {
  ['sh'] = {
    linter = shellcheck
  },
  ['swift'] = {
    linter = swiftlint
  },
}
