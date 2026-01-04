-- Navigation in vim windows and also in Mux windows gracefully.
return {
  "numToStr/Navigator.nvim",
  config = function()
    require("Navigator").setup()
  end,
  opts = function()
    vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
    vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
    vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
    vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
  end,
}
