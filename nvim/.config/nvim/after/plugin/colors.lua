require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "macchiato",
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})
vim.cmd.colorscheme "catppuccin"

