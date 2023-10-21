local config = function ()
  -- local fb_actions = require "telescope._extensions.file_browser.actions"
  require('telescope').setup {
    extensions = {
      file_browser = {
        -- theme = "ivy",
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
          },
        },
        grouped = true,
        preview = { timeout = 1000},
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        initial_mode = "normal",
        git_status = false,
      },
    },
  }

  require("telescope").load_extension "file_browser"
end

return {
  "nvim-telescope/telescope-file-browser.nvim",
  config = config,
}
