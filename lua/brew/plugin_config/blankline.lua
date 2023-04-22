-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
vim.cmd [[highlight IndentBlanklineIndent guifg=#4d4d4d gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"


require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent",
  },
}
