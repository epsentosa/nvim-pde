return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        disable = { "missing-fields" },
      },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      hint = {
        enable = true,
        arrayIndex = "Disable",
        setType = true,
      },
    },
  },
}
