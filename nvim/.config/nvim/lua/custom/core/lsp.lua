return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "b0o/schemastore.nvim",
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    -- Putting these up here for better visibility on what is pulled in
    local telescope = require("telescope.builtin")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local schemastore = require("schemastore")

    -- LSP to install and their configuration, `true` for default config.
    -- See `:help lspconfig-all` for more server config details
    local servers = {
      bashls = true,
      cssls = true,
      eslint = true,
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
          },
        },
      },
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
      marksman = true,
      pyright = true,
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

    -- Packages that are not mapped with `:h mason-lspconfig-server-map`
    -- Anything that is not an LSP should be defined here to be installed.
    local packages = {
      -- Debug adapters
      "delve",
      "js-debug-adapter",
      -- Linters
      "eslint",
      "shellcheck",
      "yamllint",
      -- Formatters
      "gofumpt",
      "mdformat",
      "ruff",
      "shfmt",
      "stylua",
    }

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers),
    })
    require("mason-tool-installer").setup({
      ensure_installed = packages,
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
        vim.lsp.config(name, config)
        vim.lsp.enable({ name })
      end
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = require("custom.util").group,
      callback = function(event)
        vim.keymap.set("n", "gd", telescope.lsp_definitions, { desc = "Goto definitions", buffer = event.buf })
        vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "Goto references", buffer = event.buf })
        vim.keymap.set("n", "gi", telescope.lsp_implementations, { desc = "Goto assignments", buffer = event.buf })
        vim.keymap.set("n", "gt", telescope.lsp_type_definitions, { desc = "Goto type definition", buffer = event.buf })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration", buffer = event.buf })
        vim.keymap.set(
          { "n", "i" },
          "<C-s>",
          vim.lsp.buf.signature_help,
          { desc = "Signature help", buffer = event.buf }
        )
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation", buffer = event.buf })
        vim.keymap.set(
          "n",
          "<leader>rr",
          vim.lsp.buf.code_action,
          { desc = "Refactor code action", buffer = event.buf }
        )
        vim.keymap.set("n", "<leader>rn", function()
          -- default vim.lsp.buf.rename does not default to empty string, this does
          vim.ui.input({ prompt = "Rename `" .. vim.fn.expand("<cword>") .. "`", default = "" }, function(input)
            if not input or #input == 0 then
              return
            end
            vim.lsp.buf.rename(input)
          end)
        end, { desc = "Refactor rename", buffer = event.buf })
      end,
    })
  end,
}
