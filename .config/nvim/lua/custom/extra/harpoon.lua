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
      { "<leader>1", function() h:list():select(1) end, desc = "Jump to bookmark 1" },
      { "<leader>2", function() h:list():select(2) end, desc = "Jump to bookmark 2" },
      { "<leader>3", function() h:list():select(3) end, desc = "Jump to bookmark 3" },
      { "<leader>4", function() h:list():select(4) end, desc = "Jump to bookmark 4" },
      { "<leader>f1", function() h:list():replace_at(1) end, desc = "Replace bookmark 1" },
      { "<leader>f2", function() h:list():replace_at(2) end, desc = "Replace bookmark 2" },
      { "<leader>f3", function() h:list():replace_at(3) end, desc = "Replace bookmark 3" },
      { "<leader>f4", function() h:list():replace_at(4) end, desc = "Replace bookmark 4" },
      { "<leader>fl", function() h.ui:toggle_quick_menu(h:list()) end, desc = "Bookmark list" },
      { "<leader>fi", function() h:list():add() end, desc = "Bookmark insert" },
    }
  end,
}
