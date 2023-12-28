local config = function ()
  local keymap = require('eps.keymaps')
  keymap.hop_keymap()
  require('hop').setup()
end

return {
  'phaazon/hop.nvim',
  branch = 'v2',
  config = config,
  event = 'VeryLazy',
}
