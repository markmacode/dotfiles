return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    ft = "markdown",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/me/notes",
        },
      },
      disable_frontmatter = true,
      templates = {
        folder = "zero/templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
    },
  },
}
