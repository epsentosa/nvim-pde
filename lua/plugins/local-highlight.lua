local config = function ()
   require('local-highlight').setup({
      hlgroup = 'LocalMatchHighlight',
      cw_hlgroup = 'LocalCurrentWord',
  })
end

return {
  'tzachar/local-highlight.nvim',
  config = config,
}
