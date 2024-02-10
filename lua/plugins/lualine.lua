-- Color for highlights
local colors = {
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

local config = function ()
  local lualine_config = {
    options = {
      component_separators = { left = ' ▏', right = ' ▏'},
      section_separators = { left = '', right = ''},
    },
    sections = {
      lualine_x = { 'encoding', 'filetype' },
      lualine_c = {},
    }
  }
  require('lualine').setup (lualine_config)
end

return {
  'nvim-lualine/lualine.nvim',
  config = config,
}
