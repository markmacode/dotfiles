-- When dealing with 2 to 3 files and needing to constantly navigate between
-- them, this harpoon can help a lot. It is particularly useful when you
-- occasionally need to go to other files outside the main ones you're
-- working on, this ensures you don't lose track of the main files and how
-- to quickly get back to them.
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("harpoon").setup({})
  end,
  keys = function()
    local h = require("harpoon")
    -- stylua: ignore
    return {
      { "<a-m>", function() h:list():select(1) end, desc = "Jump to bookmark 1" },
      { "<a-,>", function() h:list():select(2) end, desc = "Jump to bookmark 2" },
      { "<a-.>", function() h:list():select(3) end, desc = "Jump to bookmark 3" },
      { "gh", function() h.ui:toggle_quick_menu(h:list()) end, desc = "Bookmark list" },
      { "gb", function() h:list():add() end, desc = "Bookmark insert" },
    }
  end,
}
