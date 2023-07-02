vim.notify = require('notify')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- set winbar
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

local set = vim.opt

set.nu = true
set.relativenumber = true

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
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

set.mouse = "a" -- allow the mouse to be used in neovim
set.ttimeoutlen = 100
