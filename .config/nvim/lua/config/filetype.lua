vim.filetype.add({
  filename = {
    ['.Jenkinsfile'] = 'groovy',
    ['gitconfig'] = 'gitconfig',
  },
  pattern = {
    ['Jenkinsfile.*'] = 'groovy',
    ['.gitignore..*'] = 'gitignore',
  },
})
