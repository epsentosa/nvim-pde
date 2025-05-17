vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  float = {
    focusable = true,
    style = "minimal",
    source = "if_many",
    header = "",
    prefix = "",
  },
  update_in_insert = false,
  severity_sort = true,
})
