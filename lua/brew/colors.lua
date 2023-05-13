vim.cmd.colorscheme('sonokai')

-- overide hl colors from default theme below
vim.api.nvim_set_hl(0, "Visual", { link = "DiffAdd" })
vim.api.nvim_set_hl(0, 'LocalMatchHighlight', { italic = true, bg='#2b2f3c' })
vim.api.nvim_set_hl(0, 'LocalCurrentWord', { bold = true, bg='#5d616c' })
