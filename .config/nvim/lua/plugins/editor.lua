return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = true,
          use_git_status_colors = false,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            -- Change type
            added     = "",
            deleted   = "",
            modified  = "",
            renamed   = "",
            -- Status type
            untracked = "?",
            ignored   = "0",
            unstaged  = "󰅖",
            staged    = "󰄬",
            conflict  = "*",
          }
        },
      },
      window = {
        position = 'current',
        mappings = {
          ['e'] = 'open',
        },
      },
      filesystem = {
        hijack_netrw_behaviour = 'open_default',
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            "node_modules",
            "venv",
            ".git",
          },
          hide_by_pattern = {
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = {
            ".editorconfig",
            ".gitignored",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
          never_show_by_pattern = {
            --".null-ls_*",
          },
        },
      },
    },
  },
}
