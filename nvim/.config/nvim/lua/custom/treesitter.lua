require("nvim-treesitter").setup({
  ensure_install = {
    "core",
    "stable",
    "dockerfile",
    "godot_resource",
    "gdscript",
  },
})

-- I want to know if treesitter is enabled or not
require("custom.util").keys({
  {
    "<leader>ft",
    function()
      if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil then
        vim.notify("treesitter enabled")
      else
        vim.notify("treesitter NOT enabled")
      end
    end,
    desc = "Treesitter status",
  },
  {
    "<leader>fs",
    function()
      if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil then
        vim.treesitter.stop()
      else
        vim.treesitter.start()
      end
    end,
    desc = "Treesitter toggle",
  },
})

-- Enable highlighting
vim.api.nvim_create_autocmd("FileType", {
  group = require("custom.util").group,
  pattern = {
    "c",
    "cpp",
    "sh",
    "css",
    "csv",
    "gdscript",
    "go",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "lua",
    "markdown",
    "python",
    "svelte",
    "toml",
    "typescript",
    "typescriptreact",
    "vim",
    "vimdoc",
    "yaml",
  },
  callback = function()
    -- Makes indenting in jsx and tsx work, otherwise it will just go to col 0
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.treesitter.start()
  end,
})
