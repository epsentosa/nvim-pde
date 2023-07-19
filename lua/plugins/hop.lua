local config = function ()
  require('eps.keymaps')
  hop_keymap()
  require('hop').setup()
end

return {
  'phaazon/hop.nvim',
  branch = 'v2',
  config = config,
  event = 'VeryLazy',
}
