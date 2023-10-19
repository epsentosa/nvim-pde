return {
  "hinell/lsp-timeout.nvim",
  init = function()
    vim.g["lsp-timeout-config"] = {
      stopTimeout  = 1000 * 60 * 15,  -- ms, timeout before stopping all LSP servers
      startTimeout = 1000 * 1,      -- ms, timeout before restart
      silent       = false           -- true to suppress notifications
    }
  end
}
