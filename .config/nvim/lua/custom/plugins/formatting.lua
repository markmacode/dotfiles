-- List of available formatters:
-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
return {
  {
    "stevearc/conform.nvim",
    dependencies = {
      "mason.nvim",
    },
    keys = {
      {
        "<leader>f",
        function()
          if not require("conform").format() then
            vim.lsp.buf.format()
          end
        end,
        mode = { "n", "v" },
        desc = "[F]ormat file with conform",
      },
    },
    opts = {
      format = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },
      formatters_by_ft = {
        python = { "isort", "ruff_format" },
        markdown = { "mdformat" },
        sh = { "shfmt" },
        lua = { "stylua" },
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
  },
}
