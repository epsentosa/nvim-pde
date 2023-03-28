require("transparent").setup({
  extra_groups = { -- table/string: additional groups that should be cleared
  'NormalFloat',
  'TelescopeNormal',
  'NvimTreeNormal',
  'NvimTreeNormalNC',
  'EndOfBuffer',
  'QuickFixLine',
  -- 'TreesitterContext',
  },
  exclude_groups = {}, -- table: groups you don't want to clear
})
