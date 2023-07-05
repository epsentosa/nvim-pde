local config = function ()
  require('brew.keymaps')
  hop_keymap()
  require('hop').setup()
end

return {
  'phaazon/hop.nvim',
  branch = 'v2',
  config = config,
  event = 'VeryLazy',
}
