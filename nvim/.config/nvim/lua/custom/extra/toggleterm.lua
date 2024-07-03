-- Easily open up a terminal within neovim, I find this useful for opening up TUIs
-- such as lazygit. It feels much quicker than using tmux for some terminal tasks.
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
