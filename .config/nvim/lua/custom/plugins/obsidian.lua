return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/me/notes",
      },
      {
        name = "game",
        path = "~/me/repos/pooch-projectile/Docs",
      },
    },
    disable_frontmatter = true,
    templates = {
      folder = "Meta/Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
  },
}
