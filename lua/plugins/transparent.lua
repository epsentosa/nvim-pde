local config = function ()
  require("transparent").setup({
    extra_groups = { -- table/string: additional groups that should be cleared
    'NormalFloat',
    'NormalSB', -- for window help
    'TelescopeNormal',
    'TelescopeBorder',
    'NvimTreeNormal',
    'NvimTreeNormalNC',
    'EndOfBuffer',
    'QuickFixLine',
    'LazyNormal',
    'NotifyTRACEBody',
    'NotifyWARNBody',
    'NotifyINFOBody',
    'NotifyERRORBody',
    'NotifyDEBUGBody',
    'NotifyTRACEBorder',
    'NotifyWARNBorder',
    'NotifyINFOBorder',
    'NotifyERRORBorder',
    'NotifyDEBUGBorder',
    'FloatBorder',
    'GitSignsAdd',
    'GitSignsChange',
    'GitSignsDelete',
    'Pmenu',
    'TelescopePromptNormal',
    -- 'TreesitterContext',
  },
  exclude_groups = {}, -- table: groups you don't want to clear
})
end

return {
  'xiyaowong/nvim-transparent',
  config = config,
}
