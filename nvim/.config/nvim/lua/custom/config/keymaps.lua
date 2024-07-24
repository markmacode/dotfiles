require("custom.util").keys({
  -- Dable annoying stuff
  { "Q", "<nop>" },
  { "q:", "<nop>" },

  -- Just go down on wrapped lines
  { "k", 'v:count == 0 ? "gk" : "k"', expr = true, silent = true },
  { "j", 'v:count == 0 ? "gj" : "j"', expr = true, silent = true },

  -- Stay centered when jumping around
  { "n", "nzzzv" },
  { "N", "Nzzzv" },

  -- Quickly paste what you actually yanked
  { "gp", '"0p', mode = { "n", "x", "o" }, desc = "Paste last yank" },

  -- Diagnostics
  { "[q", vim.cmd.cprevious, desc = "Quickfix prev" },
  { "]q", vim.cmd.cnext, desc = "Quickfix next" },
  { "[d", vim.diagnostic.goto_prev, desc = "Goto previous diagnostic message" },
  { "]d", vim.diagnostic.goto_next, desc = "Goto next diagnostic message" },
  { "H", vim.diagnostic.open_float, desc = "Open diagnostic hover window" },
})
