-- Automatically creates sessions for projects
return {
  "rmagatti/auto-session",
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    allowed_dirs = { "~/me/repos/**/", "~/me/clones/**/", "~/dotfiles/", "~/dotfiles/nvim/.config/nvim/" },
  },
}
