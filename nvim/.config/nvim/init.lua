-- pre-plugin setup
require("custom.config.options")
require("custom.config.filetype")

-- install lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- use the `lua/custom/plugins/` directory for plugin specs
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  { import = "custom.core" },
  { import = "custom.extra" },
  { import = "custom.vendor" },
}, {
  change_detection = {
    enabled = true,
    notify = false,
  },
})

-- post-plugin setup
require("custom.config.autocmds")
require("custom.config.keymaps")

require("custom.util").keys({
  {
    "<leader>r",
    function()
      require("custom.completion")
      require("custom.files")
      require("custom.formatting")
      require("custom.lsp")
      require("custom.snippets")
      require("custom.treesitter")
      require("custom.telescope")
      require("custom.config.keymaps")
    end,
    desc = "Reload core config",
  },
})

vim.cmd.colorscheme("tokyonight")
vim.cmd.packadd("cfilter")
