local lint = require("lint")

require("custom.util").keys({
  { "<leader>fl", lint.try_lint, desc = "Lint file" },
})

lint.linters_by_ft = {
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  markdown = { "vale" },
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
  callback = function()
    lint.try_lint()
  end,
})
