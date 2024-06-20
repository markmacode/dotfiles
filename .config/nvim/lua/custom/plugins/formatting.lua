return {
  {
    "stevearc/conform.nvim",
    keys = function()
      return {
        { "<leader>ff", require("conform").format, desc = "Format file" },
      }
    end,
    opts = {
      formatters_by_ft = {
        ["_"] = { "trim_whitespace" },
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
          prepend_args = { "--number", "--wrap", "80" },
        },
      },
    },
  },
}
