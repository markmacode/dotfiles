-- Maintained fork of sindrets/diffview.nvim, same module and commands.
return {
  "dlyongemallo/diffview-plus.nvim",
  version = "*",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggle", "DiffviewFileHistory" },
  opts = {
    enhanced_diff_hl = true,
    diffopt = { algorithm = "histogram" },
    view = {
      merge_tool = {
        layout = "diff4_mixed",
        disable_diagnostics = true,
        winbar_info = true,
      },
      cycle_layouts = {
        merge_tool = { "diff4_mixed", "diff3_mixed", "diff3_horizontal", "diff1_plain" },
      },
    },
  },
  keys = {
    { "<leader>dd", "<cmd>DiffviewToggle<cr>", desc = "Diff toggle (working tree)" },
    { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    { "<leader>dh", ":DiffviewFileHistory<cr>", mode = "x", desc = "Selection history" },
    { "<leader>dH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch history" },
  },
}
