require("tokyonight").setup({
  style = "moon",         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day",    -- The theme is used when the background is set to light
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  on_highlights = function(highlights, colors)
    highlights.TreesitterContext = {
      bg = colors.bg_dark,
      fg = colors.bg_dark,
    }
  end
})

-- require("dracula").setup({
--   italic_comment = true,
-- })

-- require("catppuccin").setup({
--     flavour = "mocha", -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--         light = "latte",
--         dark = "mocha",
--     },
--     -- transparent_background = true,
--     term_colors = true,
--     dim_inactive = {
--         enabled = false,
--         shade = "dark",
--         percentage = 0.15,
--     },
-- })

-- require('onedark').setup {
--     style = 'warmer',
-- }
-- require('onedark').load()

-- require('monokai').setup {}
-- require('monokai').setup { palette = require('monokai').pro }
-- require('monokai').setup { palette = require('monokai').soda }
-- require('monokai').setup { palette = require('monokai').ristretto }

vim.cmd.colorscheme("tokyonight")
