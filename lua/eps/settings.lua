vim.notify = require('notify')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local set = vim.opt
set.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
set.nu = true
set.relativenumber = true
set.cmdheight = 1
set.tabstop = 4
set.softtabstop = -1
set.shiftwidth = 0
set.expandtab = true
set.linespace = 50
set.splitbelow = true
set.splitright = true
set.smartindent = true
set.wrap = false
set.swapfile = false
set.backup = false
set.undofile = true
set.hlsearch = false
set.incsearch = true
set.termguicolors = true
-- set.cursorline = true -- highlight the current line
set.scrolloff = 8
set.signcolumn = "yes"
set.isfname:append("@-@")
set.updatetime = 50
set.colorcolumn = "110"
set.clipboard = ""
set.lazyredraw = true
set.mouse = ""
set.ttimeoutlen = 100
set.laststatus = 3
set.list = true
set.listchars:append "space:⋅"
set.listchars:append "eol:↴"
set.completeopt:append({
  "menuone",
  "noinsert",
  "noselect",
})
