return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  opts = function()
    require("nvim-treesitter").install({
      "bash",
      "c",
      "cpp",
      "csharp",
      "css",
      "go",
      "gomod",
      "gosum",
      "java",
      "javascript",
      "jsx",
      "jinja",
      "json",
      "html",
      "lua",
      "markdown",
      "python",
      "scss",
      "sql",
      "terraform",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "xml",
      "yaml",
      "zsh",
    })

    -- I want to know if treesitter is enabled or not
    vim.keymap.set("n", "\\t", function()
      if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil then
        vim.treesitter.stop()
      else
        vim.treesitter.start()
      end
    end, { desc = "Toggle treesitter" })

    -- Enable highlighting
    vim.api.nvim_create_autocmd("FileType", {
      group = require("custom.util").group,
      pattern = {
        "go",
        "gomod",
        "gosum",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "lua",
        "markdown",
        "python",
        "sh",
        "terraform",
        "toml",
        "typescript",
        "typescriptreact",
        "vim",
        "vimdoc",
        "yaml",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })

    -- Enable indentation from treesitter
    vim.api.nvim_create_autocmd("FileType", {
      group = require("custom.util").group,
      pattern = {
        "javascriptreact",
        "typescriptreact",
      },
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
