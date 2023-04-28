local config = function ()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")

  -- Set header
  dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
  }

  -- Set menu
  dashboard.section.buttons.val = {
      dashboard.button( "n", "⋅ > Open Notes" , ":ene <BAR> MindOpenMain<CR>"),
      dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
      dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
      dashboard.button( "s", "  > Settings" , ":e $MYVIMRC<CR>"),
  }

  -- Send config to alpha
  alpha.setup(dashboard.opts)

  -- Disable folding on alpha buffer
  vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
  ]])
end

return {
  'goolord/alpha-nvim',
  dependencies = { {'nvim-tree/nvim-web-devicons'}},
  config = config,
  cmd = 'Alpha',
}
