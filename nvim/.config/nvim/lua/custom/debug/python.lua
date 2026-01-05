local dap = require("dap")
local dap_py = require("dap-python")
dap_py.setup("uv")

-- More options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
-- Using .vscode/launch.json might be a better approach on a per-project basis
table.insert(dap.configurations.python, {
  type = "python",
  request = "launch",
  name = "Debug pytest",
  module = "pytest",
})
table.insert(dap.configurations.python, {
  type = "python",
  request = "launch",
  name = "Debug pytest file",
  module = "pytest",
  args = { "${file}" },
})
