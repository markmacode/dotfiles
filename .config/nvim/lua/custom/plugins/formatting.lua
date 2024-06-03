return {
  "stevearc/conform.nvim",
  lazy = false,
  keys = function()
    local conform = require("conform")
    return {
      { "<leader>f", conform.format, desc = "[F]ormat file" },
    }
  end,
  opts = {
    format = {
      timeout_ms = 500,
      lsp_fallback = true,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
    },
    formatters_by_ft = {
      python = { "isort", "ruff_format" },
      markdown = { "mdformat" },
      sh = { "shfmt" },
      lua = { "stylua" },
      svelte = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
    },
    formatters = {
      mdformat = {
        prepend_args = { "--number" },
      },
      shfmt = {
        prepend_args = { "-i", "4", "-ci" },
      },
    },
  },
}
