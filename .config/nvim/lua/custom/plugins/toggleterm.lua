return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = true,
  opts = {},
  keys = function()
    local Terminal = require("toggleterm.terminal").Terminal
    return {
      {
      "<leader>gg",
      function()
        local lazygit = Terminal:new({
          cmd = "lazygit",
          direction = "float",
          hidden = true,
        })
        lazygit:toggle()
      end,
      desc = "Open lazygit",
      silent = true,
    },
    }
  end,
}
