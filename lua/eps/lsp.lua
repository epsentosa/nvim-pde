vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.diagnostic.config {
  virtual_text = false,
  severity_sort = true,
  float = {
    border = "single",
    source = "if_many",
    header = "",
    prefix = "",
  },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
}

vim.lsp.enable({"lua_ls", "gopls", "pyright", "ruff", "intelephense", "ts_ls",  "protols"})
