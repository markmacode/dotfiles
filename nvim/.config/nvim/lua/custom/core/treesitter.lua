return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  opts = function()
    require("nvim-treesitter").setup({
      ensure_install = {
        "core",
        "stable",
        "dockerfile",
        "gomod",
        "gdscript",
        "godot_resource",
        "graphql",
      },
    })

    -- I want to know if treesitter is enabled or not
    require("custom.util").keys({
      {
        "\\t",
        function()
          if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil then
            vim.treesitter.stop()
          else
            vim.treesitter.start()
          end
        end,
        desc = "Toggle treesitter",
      },
    })

    -- Enable highlighting
    vim.api.nvim_create_autocmd("FileType", {
      group = require("custom.util").group,
      pattern = {
        "c",
        "cpp",
        "css",
        "csv",
        "gdscript",
        "go",
        "gomod",
        "gosum",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "lua",
        "markdown",
        "python",
        "sh",
        "svelte",
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
        "svelte",
        "typescriptreact",
      },
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
