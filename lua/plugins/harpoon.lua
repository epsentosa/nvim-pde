local config = function ()
  require('eps.keymaps')
  require("harpoon").setup({
    menu = {
      width = vim.api.nvim_win_get_width(0) - 125,
    }
  })
  harpoon()
end

return {
  'theprimeagen/harpoon',
  config = config,
  keys = '<C-e>'
}
