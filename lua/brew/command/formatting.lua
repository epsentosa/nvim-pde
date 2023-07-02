vim.api.nvim_create_user_command('Format',
  function(_)
    vim.lsp.buf.format({ timeout_ms = 10000 })
  end,
  { desc = 'Format current buffer with LSP' }
)
