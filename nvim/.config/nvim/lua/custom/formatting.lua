require("custom.util").keys({
  { "<leader>ff", require("conform").format, desc = "Format file" },
})

require("conform").setup({
  formatters_by_ft = {
    ["_"] = { "trim_whitespace" },
    python = { "isort", "ruff_format" },
    markdown = { "mdformat" },
    sh = { "shfmt" },
    lua = { "stylua" },
    svelte = { "prettierd" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
  },
  formatters = {
    mdformat = {
      prepend_args = { "--number", "--wrap", "80" },
    },
  },
})
