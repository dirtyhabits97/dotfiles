local dlsconfig = require 'diagnosticls-configs'

local cpplint = require 'diagnosticls-configs.linters.cpplint'
-- luarocks install luacheck
local luacheck = require 'diagnosticls-configs.linters.luacheck'
local shellcheck = require 'diagnosticls-configs.linters.shellcheck'
local swiftlint = require 'diagnosticls-configs.linters.swiftlint'

dlsconfig.setup {
  ['cpp'] = {
    linter = cpplint
  },
  ['lua'] = {
    linter = luacheck
  },
  ['sh'] = {
    linter = shellcheck
  },
  ['swift'] = {
    linter = swiftlint
  },
}
