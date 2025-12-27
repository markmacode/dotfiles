return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- For an interactive UI
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    -- Useful debug info in the code lines
    "theHamsta/nvim-dap-virtual-text",
    -- Language specfic dap configs
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dapvirtual = require("nvim-dap-virtual-text")

    -- see :h dap-mappings for more inspiration
    vim.keymap.set("n", "<leader>bb", dap.toggle_breakpoint, { desc = "Breakpoint toggle" })
    vim.keymap.set("n", "<leader>dd", dapui.toggle, { desc = "Debug toggle UI" })
    vim.keymap.set("n", "<leader>dq", dap.close, { desc = "Debug stop" })
    vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug run last" })
    vim.keymap.set("n", "<leader>dv", dapvirtual.toggle, { desc = "Debug toggle virutal text" })
    vim.keymap.set("n", "<F3>", dap.continue, { desc = "Debug start / continue" })
    vim.keymap.set("n", "<F15>", dap.close, { desc = "Debug stop (Shift+F3)" })
    vim.keymap.set("n", "<F4>", dap.run_to_cursor, { desc = "Debug run to cursor" })
    vim.keymap.set("n", "<F5>", dap.restart, { desc = "Debug restart" })
    vim.keymap.set("n", "<F7>", dap.step_over, { desc = "Debug step over" })
    vim.keymap.set("n", "<F19>", dap.step_back, { desc = "Debug step back (Shift+F7)" })
    vim.keymap.set("n", "<F8>", dap.step_into, { desc = "Debug step into" })
    vim.keymap.set("n", "<F20>", dap.step_out, { desc = "Debug step out (Shift+F8)" })

    vim.keymap.set("n", "<leader>bl", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Breakpoint log message: "))
    end, { desc = "Breakpoint log message" })

    vim.keymap.set("n", "<leader>bc", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "), nil, nil)
    end, { desc = "Breakpoint conditional" })

    ---@diagnostic disable-next-line: missing-fields
    dapui.setup({
      icons = { collapsed = "", expanded = "", current_frame = "→" },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          position = "right",
          size = 60,
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          position = "bottom",
          size = 10,
        },
      },
    })
    dapvirtual.setup({})

    -- Setting up language specific debuggers
    require("custom.debug.go")
    require("custom.debug.javascript")
    require("custom.debug.python")

    -- Open UI when starting debugging
    dap.listeners.before.attach.dapui_config = dapui.open
    dap.listeners.before.launch.dapui_config = dapui.open

    -- Make sign column easier to parse with the eyes
    vim.fn.sign_define("DapBreakpoint", {
      text = "󰄯",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpointLine",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapBreakpointCondition", {
      text = "󰻃",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpointLine",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapLogPoint", {
      text = "󰚕",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpointLine",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapStopped", {
      text = "→",
      texthl = "DapStopped",
      linehl = "DapStoppedLine",
      numhl = "DapStopped",
    })
    vim.fn.sign_define("DapBreakpointRejected", {
      text = "󱃓",
      texthl = "DapBreakpoint",
      linehl = "DapBreakpointLine",
      numhl = "DapBreakpoint",
    })
  end,
}
