local config = function ()
  local keymap = require('eps.keymaps')
  keymap.hop_keymap()
  require('hop').setup()
end

return {
  'smoka7/hop.nvim',
  config = config,
  event = 'VeryLazy',
}
