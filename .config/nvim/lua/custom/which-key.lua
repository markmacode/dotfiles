local wk = require("which-key")

wk.register({
  ["<leader>f"] = { name = "+find" },
  ["<leader>s"] = { name = "+surround" },
  ["<leader>e"] = { name = "+edit (refactor)" },
  ["<leader>m"] = { name = "+marks (harpoon)" },
})
