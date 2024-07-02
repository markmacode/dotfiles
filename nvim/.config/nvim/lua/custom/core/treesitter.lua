return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_install = {
        "core",
        "stable",
        "godot_resource",
        "gdscript",
      },
    })

    -- Enable highlighting
    vim.api.nvim_create_autocmd("FileType", {
      group = require("custom.util").group,
      pattern = "<filetype>",
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
