local config = function ()
  -- local fb_actions = require "telescope._extensions.file_browser.actions"
  require('telescope').setup {
    extensions = {
      file_browser = {
        theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
      },
    },
  }

  require("telescope").load_extension "file_browser"
end

return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  event = 'VeryLazy',
  config = config,
}
