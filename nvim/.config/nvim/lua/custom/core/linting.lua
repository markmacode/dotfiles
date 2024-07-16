return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    require("custom.util").keys({
      { "<leader>fl", lint.try_lint, desc = "Lint file" },
    })

    lint.linters_by_ft = {
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      markdown = { "markdownlint" },
      python = { "ruff" },
      sh = { "shellcheck" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
    }

    vim.api.nvim_create_autocmd({
      "BufEnter",
      "BufWritePost",
      "TextChanged",
    }, {
      group = require("custom.util").group,
      pattern = vim.tbl_keys(lint.linters_by_ft),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
