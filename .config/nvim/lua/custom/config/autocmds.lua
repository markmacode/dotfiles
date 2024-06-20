local group = vim.api.nvim_create_augroup("mbromell", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Use my dotfiles git worktree for git integration features
-- in neovim.
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  group = group,
  callback = function()
    local cwd = vim.fn.getcwd()
    local env_xdg = vim.fn.getenv("XDG_CONFIG_HOME")
    local env_home = vim.fn.getenv("HOME")
    if cwd:sub(1, #env_xdg) == env_xdg or cwd == env_home then
      vim.env.GIT_WORK_TREE = vim.fn.expand("~")
      vim.env.GIT_DIR = vim.fn.expand("~/.dot")
    end
  end,
})

-- Unset git worktree env vars BEFORE changing dirs, because
-- the dotfiles git vars may be set but the new dir may be
-- another git project.
vim.api.nvim_create_autocmd("DirChangedPre", {
  group = group,
  callback = function()
    vim.env.GIT_WORK_TREE = nil
    vim.env.GIT_DIR = nil
  end,
})
