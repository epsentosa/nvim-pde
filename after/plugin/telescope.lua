-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  pickers = {
    buffers = {
      theme = 'dropdown',
      previewer = false,
    },
    find_files = {
      theme = 'dropdown',
      previewer = false,
    }
  },
}
