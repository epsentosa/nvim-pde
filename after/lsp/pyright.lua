return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        diagnosticMode = "off",
      },
    },
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
}