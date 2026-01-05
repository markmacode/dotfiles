return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = function()
    local parsers = {
      "bash",
      "c",
      "cpp",
      "csharp",
      "css",
      "go",
      "gomod",
      "gosum",
      "html",
      "java",
      "javascript",
      "jinja",
      "json",
      "jsx",
      "lua",
      "markdown",
      "python",
      "scss",
      "sql",
      "terraform",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "xml",
      "yaml",
      "zsh",
    }
    require("nvim-treesitter").install(parsers)
    require("nvim-treesitter").update()
  end,
  init = function()
    -- Enable highlighting
    vim.api.nvim_create_autocmd({ "FileType" }, {
      group = require("custom.util").group,
      callback = function(args)
        local filetype = args.match
        local lang = vim.treesitter.language.get_lang(filetype)
        if vim.treesitter.language.add(lang) then
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          vim.treesitter.start()
        end
      end,
    })

    -- I want to know if treesitter is enabled or not
    vim.keymap.set("n", "\\t", function()
      if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil then
        vim.treesitter.stop()
        print("treesitter off")
      else
        vim.treesitter.start()
        print("treesitter on")
      end
    end, { desc = "Toggle treesitter" })
  end,
}
