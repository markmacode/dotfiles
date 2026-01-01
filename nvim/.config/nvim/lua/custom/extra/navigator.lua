-- Mainly to edit markdown files, this will narrow the width
-- so I don't have to read sentences 200 cols wide.
-- Also good for doing split views but the code you're working with
-- on 1 window is a bit too narrow, this will widen the screen.
return {
  "numToStr/Navigator.nvim",
  opts = function()
    vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
    vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
    vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
    vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
  end,
}
