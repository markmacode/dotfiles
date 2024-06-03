--  Add any additional override configuration in the following tables.
--  Available keys are:
--  * cmd (table): Override the default command used to start the server
--  * filetypes (table): Override the default list of associated filetypes for
--    the server
--  * capabilities (table): Override fields in capabilities. Can be used to
--    disable certain LSP features.
--  * settings (table): Override the default settings passed when initializing
--    the server. For example, to see the options for `lua_ls`, you could go to
--    https://luals.github.io/wiki/settings/
local servers = {
  clangd = {},
  gopls = {},
  pyright = {},
  tsserver = {},
  bashls = {},
  svelte = {},
  html = {},
  yamlls = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        -- Toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
}

local formatters = {
  "stylua",
  "ruff",
  "prettierd",
  "prettier",
  "mdformat",
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- Useful status updates for LSP
    { "j-hui/fidget.nvim", opts = {} },

    -- Configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup(
        "mbromell-lsp-attach",
        { clear = true }
      ),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, {
            buffer = event.buf,
            desc = "LSP: " .. desc,
          })
        end

        local telescope = require("telescope.builtin")

        -- Jump to the definition of the word under your cursor.
        -- This is where a variable was first declared, or where a function is
        -- defined, etc.
        -- To jump back, press <C-t>.
        map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
        map("gr", telescope.lsp_references, "[G]oto [R]eferences")
        map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
        map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")
        map(
          "<leader>ds",
          telescope.lsp_document_symbols,
          "[D]ocument [S]ymbols"
        )
        map(
          "<leader>ws",
          telescope.lsp_dynamic_workspace_symbols,
          "[W]orkspace [S]ymbols"
        )
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("H", vim.lsp.buf.hover, "Hover Documentation")
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      end,
    })

    -- LSP servers and clients are able to communicate to each other what
    -- features they support. By default, Neovim doesn't support everything
    -- that is in the LSP specification. When you add nvim-cmp, luasnip, etc.
    -- Neovim now has *more* capabilities. So, we create new capabilities with
    -- nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      "force",
      capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    -- You can add other tools here that you want Mason to install for you, so
    -- that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, formatters)

    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
    })
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed by the
          -- server configuration above. Useful when disabling certain
          -- features of an LSP (for example, turning off formatting for
          -- tsserver)
          server.capabilities = vim.tbl_deep_extend(
            "force",
            {},
            capabilities,
            server.capabilities or {}
          )
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
