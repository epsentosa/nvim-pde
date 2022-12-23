require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
})

require("dracula").setup({
  italic_comment = true,
})

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    -- transparent_background = true,
    term_colors = true,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
})

require('onedark').setup {
    style = 'deep',
}
require('onedark').load()

-- require('monokai').setup {}
-- require('monokai').setup { palette = require('monokai').pro }
-- require('monokai').setup { palette = require('monokai').soda }
require('monokai').setup { palette = require('monokai').ristretto }

vim.cmd.colorscheme("monokai")
