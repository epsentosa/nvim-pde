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
    -- diagnostics.npm_groovy_lint,
    diagnostics.golangci_lint.with({
      -- extra_args = {
      --   "--disable staticcheck"
      -- }
    }),
    diagnostics.mypy.with({
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      filter = function(d)
        return d.severity == vim.diagnostic.severity.ERROR
      end,
    }),
    -- null_ls.builtins.diagnostics.pylint.with({
    --   method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    --   filter = function(d)
    --     return d.severity == vim.diagnostic.severity.ERROR
    --   end,
    -- })
  }

  null_ls.setup({
    sources = sources,
    fallback_severity = vim.diagnostic.severity.ERROR,
  })
end

return {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  config = config,
}
