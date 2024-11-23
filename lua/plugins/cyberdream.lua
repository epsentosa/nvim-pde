local config = function ()
  require("cyberdream").setup ({
    italic_comments = true,
    borderless_telescope = false,
  })
end

return {
  "scottmckendry/cyberdream.nvim",
  lazy = true,
  config = config,
  opts = ...
}
