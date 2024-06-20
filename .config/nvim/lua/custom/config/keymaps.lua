require("custom.util").keys({
  -- stop these
  { "Q", "<nop>" },
  { "q:", "<nop>" },

  -- just go down on wrapped lines
  { "k", 'v:count == 0 ? "gk" : "k"', expr = true, silent = true },
  { "j", 'v:count == 0 ? "gj" : "j"', expr = true, silent = true },

  -- stay centered when jumping around
  { "<C-d>", "<C-d>zz" },
  { "<C-u>", "<C-u>zz" },
  { "n", "nzzzv" },
  { "N", "Nzzzv" },

  -- diagnostics
  { "[x", vim.cmd.cprevious, desc = "Quickfix prev" },
  { "]x", vim.cmd.cnext, desc = "Quickfix next" },
  { "[d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic message" },
  { "]d", vim.diagnostic.goto_next, desc = "Go to next diagnostic message" },
  { "<leader>xi", vim.diagnostic.open_float, desc = "Open floating diagnostic message" },
  { "<leader>xl", vim.diagnostic.setloclist, desc = "Open diagnostics list" },

  -- toggle hlsearch if it's on, otherwise just do "enter"
  {
    "<CR>",
    function()
      ---@diagnostic disable-next-line: undefined-field
      if vim.opt.hlsearch:get() then
        vim.cmd.nohl()
        return ""
      end
      return "<CR>"
    end,
    expr = true,
  },

  -- lazygit
  {
    "<leader>gg",
    function()
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        hidden = true,
      })
      lazygit:toggle()
    end,
    desc = "Open lazygit",
    noremap = true,
    silent = true,
  },
})
