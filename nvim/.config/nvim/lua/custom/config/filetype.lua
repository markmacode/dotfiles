vim.filetype.add({
  extension = {
    -- Neovim guesses tinyfugue for an empty .tf file, which has no treesitter parser
    tf = "terraform",
  },
  filename = {
    [".Jenkinsfile"] = "groovy",
    ["gitconfig"] = "gitconfig",
    ["Brewfile"] = "ruby",
  },
  pattern = {
    ["Jenkinsfile.*"] = "groovy",
    [".gitignore..*"] = "gitignore",
    ["*.gd"] = "gdscript",
  },
})
