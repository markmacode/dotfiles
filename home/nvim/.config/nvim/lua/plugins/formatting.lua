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
          require("conform").format()
        end,
        mode = { "n", "v" },
        desc = "[F]ormat file with conform"
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
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        mdformat = {
          prepend_args = { "--number", "--wrap", "80" },
        },
        shfmt = {
          prepend_args = { "-i", "4", "-ci" },
        },
      },
    },
  },
}
