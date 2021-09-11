local dlsconfig = require 'diagnosticls-configs'
local swiftlint = require 'diagnosticls-configs.linters.swiftlint'

dlsconfig.setup {
  ['swift'] = {
    linter = swiftlint
  }
}
