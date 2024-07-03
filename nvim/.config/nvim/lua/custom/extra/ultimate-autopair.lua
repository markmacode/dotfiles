-- Auto closing common symbol pairs is useful in most cases, this is
-- the best plugin I could find that does this.
return {
  "altermo/ultimate-autopair.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  lazy = true,
  branch = "v0.6",
  opts = {},
}
