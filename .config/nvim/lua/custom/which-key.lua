require("which-key").register({
  ["<leader>c"] = { name = "+code/lsp" },
  ["<leader>cs"] = { name = "+surround" },
  ["<leader>f"] = { name = "+file/buffer" },
  ["<leader>g"] = { name = "+git" },
  ["<leader>s"] = { name = "+search" },
  ["["] = { name = "+prev" },
  ["]"] = { name = "+next" },
  ["z"] = { name = "+fold" },
})
