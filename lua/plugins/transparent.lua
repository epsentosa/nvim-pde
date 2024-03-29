local config = function ()
  require("transparent").setup({
    extra_groups = { -- table/string: additional groups that should be cleared
    'NormalFloat',
    'NormalSB', -- for window help
    'TelescopeNormal',
    'TelescopeBorder',
    'TelescopePromptNormal',
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
    'Folded',
    -- 'TreesitterContext',
  },
  exclude_groups = {}, -- table: groups you don't want to clear
})
end

return {
  'xiyaowong/nvim-transparent',
  config = config,
}
