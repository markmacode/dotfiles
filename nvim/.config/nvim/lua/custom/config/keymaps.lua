require("custom.util").keys({
  -- Basics
  { "Q", "<nop>" },
  { "q:", "<nop>" },

  -- Arrow keys can do something
  { "<up>", "<nop>" },
  { "<down>", "<nop>" },

  -- `Ex` aint so bad as a fallback if I ever remove file tree plugins
  -- { "<leader>.", "<cmd>Ex<cr>", desc = "File tree" },

  -- Just go down on wrapped lines
  { "k", 'v:count == 0 ? "gk" : "k"', expr = true, silent = true },
  { "j", 'v:count == 0 ? "gj" : "j"', expr = true, silent = true },

  -- Stay centered when jumping around
  { "<C-d>", "<C-d>zz" },
  { "<C-u>", "<C-u>zz" },
  { "n", "nzzzv" },
  { "N", "Nzzzv" },

  -- Diagnostics
  { "[q", vim.cmd.cprevious, desc = "Quickfix prev" },
  { "]q", vim.cmd.cnext, desc = "Quickfix next" },
  { "[x", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic message" },
  { "]x", vim.diagnostic.goto_next, desc = "Go to next diagnostic message" },
  { "<leader>xh", vim.diagnostic.open_float, desc = "Open diagnostic hover window" },
  { "<leader>xx", vim.diagnostic.setqflist, desc = "Open diagnostics list" },
  { "<leader>xX", vim.diagnostic.setloclist, desc = "Open diagnostics list (buffer)" },

  -- Toggle hlsearch if it's on, otherwise just do "enter"
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
