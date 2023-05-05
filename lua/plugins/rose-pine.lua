local config = function()
  require('rose-pine').setup({
    --- @usage 'auto'|'main'|'moon'|'dawn'
    variant = 'auto',
    --- @usage 'main'|'moon'|'dawn'
    dark_variant = 'main',
    highlight_groups = { TreesitterContext = { bg = 'base' } }
  })
end

return { 'rose-pine/neovim', config = config, lazy = true }
