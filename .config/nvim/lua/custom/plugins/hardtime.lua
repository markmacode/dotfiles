return {
  -- Gives you a hard time when you use inefficient vim keys
  "m4xshen/hardtime.nvim",
  enabled = false,
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {
    -- Add "oil" to the disabled_filetypes
    disabled_filetypes = {
      "neo-tree",
      "netrw",
      "NvimTree",
      "lazy",
      "mason",
      "oil",
    },
  },
}
