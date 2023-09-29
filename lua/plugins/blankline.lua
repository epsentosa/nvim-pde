local config = function ()
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  vim.cmd [[highlight IndentBlanklineIndent guifg=#4d4d4d gui=nocombine]]

  require('ibl').setup {
    char = '┊',
    show_trailing_blankline_indent = false,
    space_char_blankline = " ",
    show_current_context = true,
    char_highlight_list = {
      "IndentBlanklineIndent",
    },
    space_char_highlight_list = {
      "IndentBlanklineIndent",
    },
  }
end

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = config,
}
