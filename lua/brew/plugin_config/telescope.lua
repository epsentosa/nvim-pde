-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local fb_actions = require "telescope._extensions.file_browser.actions"

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
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
}

require("telescope").load_extension "file_browser"
