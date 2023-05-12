return {
  'sainnhe/sonokai',
  config = function ()
    -- `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`,`'espresso'
    vim.g.sonokai_style = "atlantis"
    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_better_performance = 1
  end,
  lazy = true,
}
