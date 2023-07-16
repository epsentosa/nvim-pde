local config = function ()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            main = "~/.main",
          },
          default_workspace = "main",
        },
      },
    },
  }
end

return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  cmd = {"Neorg", "Neorg index"},
  init = function ()
    vim.g.maplocalleader = " "

    local set = vim.opt_local
    set.foldlevelstart = 2
  end,
  config = config,
}
