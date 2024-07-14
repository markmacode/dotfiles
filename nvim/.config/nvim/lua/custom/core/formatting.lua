return {
  "stevearc/conform.nvim",
  opts = function()
    require("custom.util").keys({
      { "<leader>ff", require("conform").format, desc = "Format file" },
    })

    require("conform").setup({
      formatters_by_ft = {
        ["_"] = { "trim_whitespace" },
        css = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        go = { "goimports", "gofmt" },
        javascript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        lua = { "stylua" },
        markdown = { "mdformat" },
        python = { "isort", "ruff_format" },
        sh = { "shfmt" },
        svelte = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
      },
      formatters = {
        mdformat = {
          prepend_args = { "--number" },
        },
      },
    })
  end,
}
