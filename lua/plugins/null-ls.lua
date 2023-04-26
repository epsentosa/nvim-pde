local config = function ()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting

  local sources = {
    formatting.lua_format.with({
      extra_args = {
        "-i", "--indent-width=2", "--tab-width=2", "--column-limit=140",
        "--continuation-indent-width=2", "--no-keep-simple-function-one-line",
        "--no-keep-simple-control-block-one-line", "--no-align-args",
        "--no-align-parameter", "--no-align-table-field",
        "--no-break-after-table-lb", "--no-break-before-table-rb",
        "--chop-down-table"
      }
    }),
    formatting.prettier.with({ extra_filetypes = { "toml" } }),
    formatting.black,
    formatting.clang_format.with({
      extra_args = {
        "-style={IndentWidth: 4}"
      }
    }),
  }

  null_ls.setup({
    sources = sources,
  })
end

return {
  'jose-elias-alvarez/null-ls.nvim',
  event = 'BufReadPre',
  config = config,
}
