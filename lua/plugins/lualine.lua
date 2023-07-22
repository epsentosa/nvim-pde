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

  table.insert(lualine_config.sections.lualine_c,
  { 'lsp_progress',
    display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
    colors = {
      percentage  = colors.cyan,
      title  = colors.cyan,
      message  = colors.cyan,
      spinner = colors.cyan,
      lsp_client_name = colors.magenta,
      use = true,
    },
    separators = {
      component = ' ',
      progress = ' | ',
      percentage = { pre = '', post = '%% ' },
      title = { pre = '', post = ': ' },
      lsp_client_name = { pre = '[', post = ']' },
      spinner = { pre = '', post = '' },
      message = { commenced = 'In Progress', completed = 'Completed' },
    },
    timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
    spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
  })
  require('lualine').setup (lualine_config)
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = 'arkav/lualine-lsp-progress',
  config = config,
}
