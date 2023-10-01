local config = function ()
  vim.opt.background = "light"
  vim.cmd("TransparentToggle")
  require("monokai-nightasty").setup({
    on_highlights = function(highlights)
      highlights.IblWhitespace = nil
      highlights.TermCursor = { fg = "black" }
      highlights.Visual = { bg = "#e0e0e1" }
      highlights.LocalCurrentWord = { bold = true, bg = "#ebebeb" }
      highlights.LocalMatchHighlight = { underline = true }
      highlights.LineNrAbove = { fg = "#c9c9c9" }
      highlights.LineNr = { fg = "#0b48af" }
      highlights.LineNrBelow = { fg = "#c9c9c9" }
      highlights.InclineNormal = { bg = "#bcea87" }
    end,
  })
end

return {
  "polirritmico/monokai-nightasty.nvim",
  lazy = true,
  priority = 1000,
  config = config
}
