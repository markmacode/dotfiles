vim.filetype.add({
  filename = {
    ['.Jenkinsfile'] = 'groovy',
    ['gitconfig'] = 'gitconfig',
    ['Brewfile'] = 'ruby',
  },
  pattern = {
    ['Jenkinsfile.*'] = 'groovy',
    ['.gitignore..*'] = 'gitignore',
  },
})
