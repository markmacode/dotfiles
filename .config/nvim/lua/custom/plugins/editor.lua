return {
  {
    "stevearc/oil.nvim",
    opts = {},
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
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
            added = "",
            deleted = "",
            modified = "",
            renamed = "",
            -- Status type
            untracked = "?",
            ignored = "0",
            unstaged = "󰅖",
            staged = "󰄬",
            conflict = "*",
          },
        },
      },
      window = {
        position = "current",
        mappings = {
          ["l"] = "toggle_node",
          ["h"] = "focus_preview",
        },
      },
      filesystem = {
        hijack_netrw_behaviour = "open_default",
        filtered_items = {
          hide_dotfiles = true,
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
            ".gitignore",
            ".debug",
            ".scripts",
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
