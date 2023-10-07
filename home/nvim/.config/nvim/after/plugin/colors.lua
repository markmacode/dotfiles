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

vim.cmd("colorscheme nightfox")

