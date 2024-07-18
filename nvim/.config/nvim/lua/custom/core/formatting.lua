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
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        lua = { "stylua" },
        markdown = { "mdformat" },
        python = { "ruff_organize_imports", "ruff_format" },
        sh = { "shfmt" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },
      formatters = {
        mdformat = {
          prepend_args = { "--number" },
        },
      },
    })
  end,
}
