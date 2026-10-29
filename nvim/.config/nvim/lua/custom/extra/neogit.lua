-- Magit-style git UI; diffs open in diffview.
return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  dependencies = { "dlyongemallo/diffview-plus.nvim" },
  opts = {
    integrations = { diffview = true },
  },
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit status" },
    { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Commit" },
    { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Push" },
    { "<leader>gP", "<cmd>Neogit pull<cr>", desc = "Pull" },
    { "<leader>gb", "<cmd>Neogit branch<cr>", desc = "Branch" },
    { "<leader>gl", "<cmd>Neogit log<cr>", desc = "Log" },
  },
}
