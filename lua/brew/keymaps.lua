-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = {silent = true}

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)  -- Currently use CapSlock, no need to map

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
keymap("n", "<C-f>", "<C-f>zz")
keymap("n", "<C-b>", "<C-b>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- delete to void
keymap({"n", "v"}, "<leader>d", [["_d]])

-- copy just only use for mac
keymap({"n", "v"}, "<C-c>", [["+y]])

keymap("n", "<leader>e", vim.cmd.NvimTreeToggle, opts)
keymap("n", "<leader>t", vim.cmd.TransparentToggle, opts)

-- buffer management
keymap("n", "qq", '<cmd>Bdelete this<CR>', opts)
keymap("n", "H", vim.cmd.TablineBufferPrevious, opts)
keymap("n", "L", vim.cmd.TablineBufferNext, opts)

-- Lazy Git
keymap("n", "<leader>lg", vim.cmd.LazyGit, opts)

-- Lazy UI
keymap("n", "<leader>l", vim.cmd.Lazy, opts)

-- Outline
keymap('n', '<leader>o', '<cmd>SymbolsOutline<CR>')

-- Mind Notes
keymap('n', '<leader>n', '<cmd>MindOpenMain<CR>')

-- Using substitute keymap
-- keymap("n", "s", "<cmd>lua require('substitute').operator()<cr>",
--        {noremap = true})
-- keymap("n", "ss", "<cmd>lua require('substitute').line()<cr>", {noremap = true})
-- keymap("n", "S", "<cmd>lua require('substitute').eol()<cr>", {noremap = true})
-- keymap("x", "s", "<cmd>lua require('substitute').visual()<cr>", {noremap = true})

-- Telescope
local telescope = require('telescope.builtin')
-- See `:help telescope.builtin`

-- MASIH GABISA
-- keymap('n', '<leader>/', function()
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer' })

-- ALTERNATIF
keymap('n', '<leader>/',
       "<cmd>lua require'telescope.builtin'.live_grep{ search_dirs={\"%:p\"} }<cr>")

keymap('n', '<leader>?', require('telescope.builtin').oldfiles,
       {desc = '[?] Find recently opened files'})
keymap('n', '<leader>b', telescope.buffers, {desc = '[ ] Find existing buffers'})
keymap('n', '<leader>sf', telescope.find_files, {desc = '[S]earch [F]iles'})
keymap('n', '<leader>sh', telescope.help_tags, {desc = '[S]earch [H]elp'})
keymap('n', '<leader>sw', telescope.grep_string,
       {desc = '[S]earch current [W]ord'})
keymap('n', '<leader>sg', telescope.live_grep, {desc = '[S]earch by [G]rep'})
keymap('n', '<leader>sd', telescope.diagnostics,
       {desc = '[S]earch [D]iagnostics'})

keymap('n', '<leader>hh', telescope.highlights, {desc = 'highlights'})

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>df', vim.diagnostic.open_float)
keymap('n', '<leader>q', vim.diagnostic.setloclist)

-- Toggle diagnostic
local diagnostics_active = true
vim.keymap.set('n', '<leader>da', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end)

--  LSP
on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then desc = 'LSP: ' .. desc end

    vim.keymap.set('n', keys, func, {buffer = bufnr, desc = desc})
  end

  nmap('<leader>r', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', telescope.lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols,
       '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder,
       '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder,
       '[W]orkspace [R]emove Folder')
  nmap('<leader>wl',
       function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
       '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format({timeout_ms = 10000})
  end, {desc = 'Format current buffer with LSP'})
end
