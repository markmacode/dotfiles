return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = function()
    require("custom.util").keys({
      {
        "<leader>ff",
        function()
          require("conform").format({ lsp_format = "fallback" })
        end,
        desc = "Format file",
      },
      {
        "<leader><space>",
        function()
          require("conform").format({ lsp_format = "fallback" })
          vim.cmd("write")
        end,
        desc = "Format and save",
      },
    })

    require("conform").setup({
      formatters_by_ft = {
        ["_"] = { "trim_whitespace" },
        css = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
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
