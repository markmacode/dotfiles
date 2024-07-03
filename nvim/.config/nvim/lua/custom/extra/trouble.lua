-- Very good for exploratoy programming, especially on new projects that you
-- have to learn. It is also good when you was to go through diagnostic issues
-- to quickly preview / fix them.
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    modes = {
      -- I don't want my symbol list to show the line preview too, so messy.
      mine_symbols = {
        mode = "symbols",
        format = "{kind_icon} {symbol.name} {pos}",
      },
      -- Removing the `lsp_declarations` because I genearlly don't need it.
      mine_lsp = {
        mode = "lsp",
        sections = {
          "lsp_definitions",
          "lsp_references",
          "lsp_implementations",
          "lsp_type_definitions",
          "lsp_incoming_calls",
          "lsp_outgoing_calls",
        },
      },
    },
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics",
    },
    {
      "<leader>xb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xc",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
    -- Good for exploration and navigation of large files.
    {
      "<leader>xo",
      "<cmd>Trouble mine_symbols toggle focus=false win.size=50<cr>",
      desc = "File symbol outline",
    },
    -- VERY good for exploration, especially when learning new code bases.
    {
      "<leader>xa",
      "<cmd>Trouble mine_lsp toggle focus=true win.position=left win.size=0.3<cr>",
      desc = "List all LSP connections",
    },
  },
}
