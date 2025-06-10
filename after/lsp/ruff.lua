return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  init_options = {
    settings = {
      args = {
        "--extend-select=W,COM,ICN",
        "--ignore=E501,E722,COM812",
      },
    },
  },
}
