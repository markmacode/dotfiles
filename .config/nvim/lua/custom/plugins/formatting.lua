-- List of available formatters:
-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
return {
  {
    "stevearc/conform.nvim",
    dependencies = {
      "mason.nvim",
    },
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
        ["_"] = { "trim_whitespace" },
      },
      formatters = {
        prettier = {
          prepend_args = { "--plugin=prettier-plugin-svelte" },
        },
        mdformat = {
          prepend_args = { "--number" },
        },
        shfmt = {
          prepend_args = { "-i", "4", "-ci" },
        },
      },
    },
  },
}
