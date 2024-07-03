-- Does a lot of automatic and sensible changes when dealing with HTML
-- tags. Saves a lot of time by not needing to jump between opening and
-- closing tags, and also not needing to manually type the closing tags.
return {
  "windwp/nvim-ts-autotag",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
