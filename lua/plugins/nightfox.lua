local config  = function ()
  require('nightfox').setup({
    options = {
      module_default = true,   -- Default enable value for modules
      styles = {               -- Style to be applied to different syntax groups
        comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
        conditionals = "NONE",
        constants = "NONE",
        functions = "NONE",
        keywords = "italic",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "NONE",
        variables = "NONE",
      },
      inverse = {             -- Inverse highlight for different types
        match_paren = false,
        visual = false,
        search = false,
      },
      modules = {             -- List of various plugins and additional options
        -- ...
      },
    },
    palettes = {},
    specs = {},
    groups = {},
  })
end

-- choices on colorscheme nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
return {
  'EdenEast/nightfox.nvim',
  lazy = true,
  config = config,
}
