require("nightfox").setup({
    options = {
        styles = {
            comments = "italic",
        }
    }
})

require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    contrast = "soft", -- can be "hard", "soft" or empty string
})

require("catppuccin").setup({
    flavour = "mocha",
    background = {
        light = "latte",
        dark = "mocha",
    },
    term_colors = true,
    dim_inactive = {
        enabled = false,
    },
})

vim.cmd("colorscheme nightfox")

-- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#585b70', bold=false })
-- vim.api.nvim_set_hl(0, 'LineNr', { fg='#6c7086', bold=true })
-- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#585b70', bold=false })

