local config = function ()
  -- [[ Configure Telescope ]]
  -- See `:help telescope` and `:help telescope.setup()`
  require('telescope').setup {
    defaults = {
      prompt_prefix = "   ",
      -- Configure ripgrep to ignore .ignore files but respect .gitignore
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--no-ignore-dot",  -- Ignore .ignore and .rgignore files, but keep .gitignore
      },
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
        ["zf-native"] = {}
    },
  }

  require("telescope").load_extension("zf-native")
end

return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.6',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'natecraddock/telescope-zf-native.nvim' },
  },
  -- event = 'VeryLazy',
  config = config,
}
