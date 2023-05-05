local config = function ()
  require('kanagawa').setup({
      undercurl = true,            -- enable undercurls
      commentStyle = { italic = true },
  })
end

return {
  'rebelot/kanagawa.nvim',
  config = config,
  lazy = true,
}
