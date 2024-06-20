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
      { "<leader>1", function() h:list():select(1) end, desc = "Harpoon 1" },
      { "<leader>2", function() h:list():select(2) end, desc = "Harpoon 2" },
      { "<leader>3", function() h:list():select(3) end, desc = "Harpoon 3" },
      { "<leader>4", function() h:list():select(4) end, desc = "Harpoon 4" },
      { "<leader>fl", function() h.ui:toggle_quick_menu(h:list()) end, desc = "Bookmark list" },
      { "<leader>fi", function() h:list():add() end, desc = "Bookmark insert" },
    }
  end,
}
