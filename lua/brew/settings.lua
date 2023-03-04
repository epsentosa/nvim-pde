vim.opt.guicursor = ""

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.python3_host_prog = "$HOME/.venvs/vim/bin/python"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.cursorline = true -- highlight the current line

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "110"

vim.opt.clipboard = ""
vim.opt.lazyredraw = true

vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.ttimeoutlen=100

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- set winbar
-- vim.cmd [[set winbar=%m\ %f]]  -- Used when not using bufferline
