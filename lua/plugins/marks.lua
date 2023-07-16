local config = function ()
  require'marks'.setup {
    mappings = {
      next = "]x",
      prev = "[x",
    }
  }
end

return {
  'chentoast/marks.nvim',
  config = config,
}
