vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "Q", "<nop>")

-- move selected and indent automatically
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- half-page jumping but stay centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search terms stay centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- put semicolon at end
vim.keymap.set("n", "<leader>;", "A;<Esc>")

-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Neotree ]]
-- see `:help neo-tree` or `:help Neotree`
vim.keymap.set(
  'n', '<leader>nf',
  '<cmd>Neotree position=current<CR>',
  { desc = '[N]eotree [F]iles' }
)
vim.keymap.set(
  'n', '<leader>ng',
  '<cmd>Neotree source=git_status position=current<CR>',
  { desc = '[N]eotree [G]it status' }
)
vim.keymap.set(
  'n', '<leader>nb',
  '<cmd>Neotree source=buffers position=current<CR>',
  { desc = '[N]eotree [B]uffers' }
)
vim.keymap.set(
  'n', '<leader>nr',
  '<cmd>Neotree position=right<CR>',
  { desc = '[N]eotree [R]ight' }
)

-- [[ Telescope ]]
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Smart navigation
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- [[ Diagnostics ]]
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Harpoon ]]
vim.keymap.set(
  "n", "<leader>hi", require("harpoon.mark").add_file,
  { desc = '[H]arpoon [I]nsert file' }
)
vim.keymap.set(
  "n", "<leader>hl", require("harpoon.ui").toggle_quick_menu,
  { desc = '[H]arpoon [L]ist files' }
)
vim.keymap.set(
  "n", "<leader>hn", require("harpoon.ui").nav_next,
  { desc = 'Harpoon [T]o [N]ext' }
)
vim.keymap.set(
  "n", "<leader>hp", require("harpoon.ui").nav_prev,
  { desc = 'Harpoon [T]o [P]revious' }
)
vim.keymap.set(
  "n", "<leader>j", function() require("harpoon.ui").nav_file(1) end,
  { desc = 'Harpoon to 1' }
)
vim.keymap.set(
  "n", "<leader>k", function() require("harpoon.ui").nav_file(2) end,
  { desc = 'Harpoon to 2' }
)
vim.keymap.set(
  "n", "<leader>l", function() require("harpoon.ui").nav_file(3) end,
  { desc = 'Harpoon to 3' }
)
