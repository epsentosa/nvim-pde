vim.cmd.colorscheme('sonokai')

local set_hl = vim.api.nvim_set_hl
-- overide hl colors from default theme below
set_hl(0, "Visual", { bg = "#346273" })
set_hl(0, 'LocalMatchHighlight', { italic = true, bg='#2b2f3c' })
set_hl(0, 'LocalCurrentWord', { bold = true, bg='#3c404e' })
