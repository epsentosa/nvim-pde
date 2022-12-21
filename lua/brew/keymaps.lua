vim.g.mapleader = " "
-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

keymap("n", "<leader>e", vim.cmd.Ex, opts)

-- buffer management
keymap("n", "<leader>c", vim.cmd.bdelete, opts)
keymap("n", "[", vim.cmd.bp, opts)
keymap("n", "]", vim.cmd.bn, opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- delete to void
keymap({"n", "v"}, "<leader>d", [["_d]])

-- copy just only use for mac
keymap({"n", "v"}, "<C-c>", [["+y]])

-- change regex directly
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>p', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
