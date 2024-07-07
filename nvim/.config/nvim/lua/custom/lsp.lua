-- Putting these up here for better visibility on what is pulled in
require("mason").setup()
require("mason-lspconfig").setup()
local telescope = require("telescope.builtin")
local lspconfig = require("lspconfig")
local installer = require("mason-tool-installer")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local keys = {
  { "<leader>ld", telescope.lsp_definitions, desc = "Goto definitions" },
  { "<leader>lr", telescope.lsp_references, desc = "Goto references" },
  { "<leader>li", telescope.lsp_implementations, desc = "Goto implementations" },
  { "<leader>lt", telescope.lsp_type_definitions, desc = "Goto type definition" },
  { "<C-a>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature help (args)" },
  { "K", vim.lsp.buf.hover, desc = "Hover documentation" },
  { "<leader>lD", vim.lsp.buf.declaration, desc = "Goto declaration" },
  { "<leader>aa", vim.lsp.buf.code_action, desc = "Code action" },
  {
    "<leader>ar",
    function()
      -- default vim.lsp.buf.rename does not default to empty string, this does
      vim.ui.input({ prompt = "New Name: ", default = "" }, function(input)
        vim.lsp.buf.rename(input)
      end)
    end,
    desc = "Rename",
  },
}

vim.api.nvim_create_autocmd("LspAttach", {
  group = require("custom.util").group,
  callback = function(event)
    require("custom.util").keys(keys, { buffer = event.buf })
  end,
})

-- LSP to install and their configuration, `true` for default config.
-- See `:help lspconfig-all` for more server config details
local servers = {
  clangd = true,
  cssls = true,
  gopls = true,
  pyright = true,
  tsserver = true,
  bashls = true,
  svelte = true,
  html = true,
  yamlls = true,
  lua_ls = true,
}

-- Anything else from mason that is not an LSP
local tools = {
  "stylua",
  "ruff",
  "prettierd",
  "prettier",
  "mdformat",
}

-- Make life easy for me and install what I need
vim.list_extend(tools, vim.tbl_keys(servers))
installer.setup({ ensure_isntalled = tools })

-- Adding actual functionality to the servers
-- stylua: ignore
local capabilities = vim.tbl_deep_extend('force',
  vim.lsp.protocol.make_client_capabilities(),
  cmp_nvim_lsp.default_capabilities()
)

-- Setting up the servers
for name, config in pairs(servers) do
  if config == true then
    ---@diagnostic disable-next-line: cast-local-type
    config = {}
  end
  if config ~= false then
    config.capabilities = capabilities
    lspconfig[name].setup(config)
  end
end
