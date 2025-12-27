-- I tried to use mini.statusline, but it was just too cluttered.
-- This plugin gives everything you need in terms of function, and as
-- a positive it also looks pretty. It gives you all the information
-- you need around context of the current buffer, git context, and
-- diagnostic summaries.
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "│", right = "│" },
      },
      sections = {
        lualine_c = {
          { "filename", path = 1 },
        },
      },
    })
  end,
}
