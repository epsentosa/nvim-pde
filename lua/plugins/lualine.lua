local config = function ()
  require('lualine').setup {
    options = { theme = "tokyonight" },
    sections = {
      lualine_x = { 'encoding', 'filetype' },
    }
  }
end

return {
  'nvim-lualine/lualine.nvim',
  config = config,
}
