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
  { "[q", vim.cmd.cprevious, desc = "Quickfix prev" },
  { "]q", vim.cmd.cnext, desc = "Quickfix next" },
  { "[x", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic message" },
  { "]x", vim.diagnostic.goto_next, desc = "Go to next diagnostic message" },
  { "<leader>xh", vim.diagnostic.open_float, desc = "Open diagnostic hover window" },
  { "<leader>xx", vim.diagnostic.setqflist, desc = "Open diagnostics list" },
  { "<leader>xX", vim.diagnostic.setloclist, desc = "Open diagnostics list (buffer)" },

  -- toggle hlsearch if it's on, otherwise just do "enter"
  {
    "<cr>",
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
})
