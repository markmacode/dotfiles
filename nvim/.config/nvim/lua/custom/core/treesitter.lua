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

    -- Enable highlighting on all file types
    vim.api.nvim_create_autocmd("FileType", {
      group = require("custom.util").group,
      callback = function(opts)
        local language = vim.treesitter.language.get_lang(opts.match)
        if language == nil then
          return
        end
        local parsers = vim.tbl_keys(require("nvim-treesitter.parsers"))
        if vim.list_contains(parsers, language) then
          vim.treesitter.start()
        end
      end,
    })
  end,
}
