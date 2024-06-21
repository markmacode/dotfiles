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
    local group = vim.api.nvim_create_augroup("mbromell-treesitter", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = "<filetype>",
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
