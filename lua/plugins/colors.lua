local config = function ()
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

  vim.cmd.colorscheme("tokyonight")
end

return {
  'folke/tokyonight.nvim',
  config = config,
}
