local config  = function ()
  require('glow').setup({
    border = "rounded",
  })
end

return {
  'ellisonleao/glow.nvim',
  config = config,
  cmd = 'Glow'
}
