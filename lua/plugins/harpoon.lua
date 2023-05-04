return {
  'theprimeagen/harpoon',
  config = function ()
    require('brew.keymaps')
    harpoon()
  end,
  keys = '<C-e>'
}
