-- This is a table that defines a collection of keymaps for neovim.
--
-- The reason to have singel table for this is so that keymaps are
-- shown in a more unified way, if you want to add, change, or view
-- what maps are set, you just go here.
--
-- A quality of life upgrade that I personally think is better, is
-- putting the `lhs` and `rhs` part of the map FIRST. When I look for
-- a ganeral `keymap.set` I almost never care to look for the `mode`
-- first, so you have something like `vim.keymap.set('n', ...)`. This
-- is so much empty useless infomation just blurring what my keymaps
-- actually are. The actual mapped `lhs` should be what is first on
-- the arg list or at the top of the table, each keymap for this table
-- has the following layout:
--
--   {
--     lhs: string,
--     rhs: string|function,
--     mode: string|table,
--     description: string,
--     opts: table|nil,
--   }
local resets = {
  J = { "<nop>" },
  K = { "<nop>" },
}

local keymap = {
  J = {
    d = { vim.diagnostic.goto_next, "next: diagnostic" },
  },
  K = {
    d = { vim.diagnostic.goto_prev, "previous: diagnostic" },
  },
  ["<leader>"] = {
    d = function()
      local t = require("telescope.builtin")
      return {
        b = { t.diagnostics({ bufnr = 0 }), "diagnostics: in buffer" },
        w = { t.diagnostics, "diagnostics: in workspace" },
      }
    end,
    r = function()
      return {
        n = { vim.lsp.buf.rename, "refactor: rename" },
        a = { vim.lsp.buf.code_action, "refactor: code action" },
      }
    end,
    l = function()
      local t = require("telescope.builtin")
      return {
        s = {
          t.lsp_document_symbols({
            symbols = { "function", "method", "class", "struct" },
          }),
          "lsp: buffer symbols",
        },
        d = { t.lsp_definitions, "lsp: definitions of word" },
        D = { vim.lsp.buf.declaration, "lsp: declaration of word" },
        i = { t.lsp_implementations, "lsp: implementations of word" },
        r = { t.lsp_references, "lsp: references for word" },
        t = { t.lsp_type_definitions, "lsp: type definitions of word" },
        w = { t.lsp_dynamic_workspace_symbols, "lsp: workspace symbols" },
      }
    end,
    s = function()
      local t = require("telescope.builtin")
      return {
        f = { t.find_files, "search: workspace files" },
        g = { t.live_grep, "search: workspace with grep" },
        h = { t.help_tags, "search: help tags" },
        r = { t.resume, "search: resume" },
        w = { t.grep_string, "search: workspace for word" },
      }
    end,
  },
}
