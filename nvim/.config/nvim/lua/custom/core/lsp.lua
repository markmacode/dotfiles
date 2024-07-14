return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "b0o/schemastore.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
      },
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      -- Putting these up here for better visibility on what is pulled in
      local telescope = require("telescope.builtin")
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local schemastore = require("schemastore")

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

      -- LSP to install and their configuration, `true` for default config.
      -- See `:help lspconfig-all` for more server config details
      local servers = {
        bashls = true,
        clangd = true,
        cssls = true,
        eslint = true,
        gopls = true,
        graphql = true,
        html = true,
        jsonls = {
          settings = {
            json = {
              schemas = schemastore.json.schemas(),
              validate = { enable = true },
            },
          },
        },
        lua_ls = true,
        pyright = true,
        svelte = true,
        tsserver = true,
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                -- disable builting schema store in favor of plugin
                enable = false,
                url = "",
              },
              schemas = schemastore.yaml.schemas(),
            },
          },
        },
      }

      -- Anything else from mason that is not an LSP
      local tools = {
        "yamllint",
        "goimports",
        "mdformat",
        "prettier",
        "prettierd",
        "ruff",
        "shellcheck",
        "shfmt",
        "stylua",
        "vale",
      }

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
      })
      require("mason-tool-installer").setup({
        ensure_installed = tools,
      })

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

      vim.api.nvim_create_autocmd("LspAttach", {
        group = require("custom.util").group,
        callback = function(event)
          require("custom.util").keys(keys, { buffer = event.buf })
        end,
      })
    end,
  },
}
