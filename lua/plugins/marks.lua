local config = function ()
  require'marks'.setup {
    mappings = {
      next = "]m",
      prev = "[m",
    }
  }
end

return {
  'chentoast/marks.nvim',
  config = config,
}
