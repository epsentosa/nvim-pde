local config = function ()
  require("gruvbox").setup ({
    italic = {
      strings = false,
      comments = true,
      operators = false,
      folds = false,
      emphasis = false,
    },
    transparent_mode = true,
  })
end

return {
  "ellisonleao/gruvbox.nvim",
  lazy = true,
  config = config,
  opts = ...
}
