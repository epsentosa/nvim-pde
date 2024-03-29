local config = function()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  local sources = {
    formatting.stylua,
    formatting.prettier.with({ extra_filetypes = { "toml" } }),
    formatting.black,
    formatting.clang_format.with({
      extra_args = {
        "-style={IndentWidth: 4}",
      },
    }),
    formatting.npm_groovy_lint,
    diagnostics.golangci_lint.with({
      extra_args = {
        "--disable staticcheck"
      }
    }),
    diagnostics.mypy,
    diagnostics.npm_groovy_lint,
  }

  null_ls.setup({
    sources = sources,
  })
end

return {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  config = config,
}
