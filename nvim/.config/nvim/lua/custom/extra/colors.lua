return {
  -- The best color scheme I found so far for a good balance of contrast
  -- and use of colors. I dont like color schemes that use too much red on
  -- a dark background, it is possibly the worst sin of readabilty.
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        style = "night",
        on_highlights = function(hl, c)
          hl.LineNrAbove = { bg = c.bg, fg = c.comment }
          hl.LineNrBelow = { bg = c.bg, fg = c.comment }
        end,
      }
    end,
  },
}
