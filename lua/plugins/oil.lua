local config = function ()
  require("oil").setup({
    float = {
      -- Padding around the floating window
      padding = 2,
      max_width = 130,
      max_height = 30,
      border = "rounded",
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      override = function(conf)
        return conf
      end,
    },
    win_options = {
      colorcolumn = "",
    },
    view_options = {
      show_hidden = true,
    },
  })
end

return {
  'stevearc/oil.nvim',
  config = config,
}
