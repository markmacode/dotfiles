local function augroup(name)
  return vim.api.nvim_create_augroup("mbromell_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Use my dotfiles git worktree for git integration features
-- in neovim.
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  group = augroup("dirchanged_dotfiles_git"),
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
-- another git project .
vim.api.nvim_create_autocmd("DirChangedPre", {
  group = augroup("dirchanged_pre_dofile_git"),
  callback = function()
    vim.env.GIT_WORK_TREE = nil
    vim.env.GIT_DIR = nil
  end,
})
