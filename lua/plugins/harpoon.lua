local config = function ()
  local keymap = require('eps.keymaps')
  local harpoon = require("harpoon")
  harpoon:setup({
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    }
  })
  keymap.harpoon_keymap(harpoon)
end

return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  config = config,
  keys = '<C-e>'
}
