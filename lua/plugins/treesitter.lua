return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install({
      ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "python", "go", "sql", "yaml" },
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'go', 'python', 'javascript', 'typescript', 'c', 'rust', 'sql', 'yaml' },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
