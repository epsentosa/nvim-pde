return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install({
      ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "python", "go", "sql", "yaml" },
    })
  end,
}
