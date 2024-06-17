local util = require("custom.util")

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("mbromell-lsp-attach", { clear = true }),
      callback = function(event)
        local tb = require("telescope.builtin")
        require("custom.util").keys({
          { "<leader>ld", tb.lsp_definitions, desc = "[G]oto [D]efinition" },
          { "<leader>lr", tb.lsp_references, desc = "[G]oto [R]eferences" },
          { "<leader>li", tb.lsp_implementations, desc = "[G]oto [I]mplementation" },
          { "<leader>lt", tb.lsp_type_definitions, desc = "Type [D]efinition" },
          { "<leader>lD", vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration" },
          { "<leader>ar", vim.lsp.buf.rename, desc = "[R]e[n]ame" },
          { "<leader>aa", vim.lsp.buf.code_action, desc = "[C]ode [A]ction" },
          { "H", vim.lsp.buf.hover, desc = "Hover Documentation" },
        }, { buffer = event.buf })
      end,
    })

    local servers = {
      clangd = true,
      gopls = true,
      pyright = true,
      tsserver = true,
      bashls = true,
      svelte = true,
      html = true,
      yamlls = true,
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    }

    -- might need tool isntaller again
    local tools = {
      stylua = true,
      ruff = true,
      prettierd = true,
      prettier = true,
      mdformat = true,
    }

    local capabilities = util.combine({
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities(),
    })

    require("mason").setup()

    local lspconfig = require("lspconfig")
    for name, config in pairs(util.combine(servers, tools)) do
      if config == true then
        config = {}
      end
      config.capabilities = capabilities
      lspconfig[name].setup(config)
    end
  end,
}
