-- Docs for config:
-- https://github.com/microsoft/vscode-js-debug/blob/main/OPTIONS.md
local dap = require("dap")

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- Installed by mason, see `custom/core/lsp.lua`
    args = {
      vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

dap.adapters.chrome = {
  type = "server",
  host = "localhost",
  port = "9222",
}

dap.configurations.javascript = {
  {
    -- dap options
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    -- vscode-js-debug options
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}
