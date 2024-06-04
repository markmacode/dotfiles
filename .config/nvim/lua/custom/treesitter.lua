---@diagnostic disable: missing-fields
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "css",
    "gdscript",
    "godot_resource",
    "javascript",
    "kdl",
    "lua",
    "markdown_inline",
    "python",
    "rust",
    "svelte",
    "typescript",
    "yaml",
  },
  auto_install = true,
  autotag = { enable = true },
  endwise = { enable = true },
  indent = { enable = false },
  highlight = {
    enable = true,
    -- For better performance and making sure there is no conflicts
    -- with highlight grups that interact directly with treesitter.
    additional_vim_regex_highlighting = false,
  },
  textsubjects = {
    enable = true,
    prev_selection = ",", -- (Optional) keymap to select the previous selection
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
      ["i;"] = {
        "textsubjects-container-inner",
        desc = "Select inside containers",
      },
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["at"] = "@comment.outer",
        ["ic"] = "@class.inner",
        ["ac"] = "@class.outer",
        ["ii"] = "@conditional.inner",
        ["ai"] = "@conditional.outer",
        -- mini.ai conflicts with this, their one is a function call
        -- this one is just a function definition, both are useful.
        -- ["if"] = "@function.inner",
        -- ["af"] = "@function.outer",
        ["io"] = "@loop.inner",
        ["ao"] = "@loop.outer",
        ["ia"] = "@parameter.inner",
        ["aa"] = "@parameter.outer",
        ["ir"] = "@return.inner",
        ["ar"] = "@return.outer",

        -- Could be goot for HTML
        -- [""] = "@attribute.inner",
        -- [""] = "@attribute.outer",
      },
    },
  },
})
