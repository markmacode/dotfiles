return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {},
  config = function(_, opts)
    require("harpoon").setup(opts)
  end,
  keys = function()
    local harpoon = require("harpoon")
    return {
      {
        "<leader>1",
        function()
          harpoon:list():select(1)
        end,
        desc = "Harpoon 1",
      },
      {
        "<leader>2",
        function()
          harpoon:list():select(2)
        end,
        desc = "Harpoon 2",
      },
      {
        "<leader>3",
        function()
          harpoon:list():select(3)
        end,
        desc = "Harpoon 3",
      },
      {
        "<leader>4",
        function()
          harpoon:list():select(4)
        end,
        desc = "Harpoon 4",
      },

      {
        "<a-5>",
        function()
          harpoon:list():next()
        end,
        desc = "Harpoon next",
      },
      {
        "<a-6>",
        function()
          harpoon:list():prev()
        end,
        desc = "Harpoon prev",
      },
      {
        "<leader>hf",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon toggle menu",
      },
      {
        "<leader>ha",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon add",
      },
    }
  end,
}
