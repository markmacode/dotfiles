return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    require("custom.util").keys({
      { "gl", lint.try_lint, desc = "Lint file" },
    })

    lint.linters_by_ft = {
      python = { "ruff" },
      sh = { "shellcheck" },
      yaml = { "yamllint" },
    }

    vim.api.nvim_create_autocmd({
      "BufEnter",
      "BufWritePost",
      "InsertLeave",
      "TextChanged",
    }, {
      group = require("custom.util").group,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
