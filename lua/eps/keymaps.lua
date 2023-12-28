local M = {}
-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
-- Telescope
local telescope = require("telescope.builtin")
-- See `:help telescope.builtin`

function M.default_keymaps()
  -- Insert --
  -- Press jk fast to enter
  -- keymap("i", "jk", "<ESC>", opts)  -- Currently use CapSlock, no need to map

  -- Visual --
  -- Stay in indent mode
  keymap("v", "<", "<gv", opts)
  keymap("v", ">", ">gv", opts)

  -- Normal --
  -- Better window navigation
  -- keymap("n", "<C-h>", "<C-w>h", opts)
  -- keymap("n", "<C-j>", "<C-w>j", opts)
  -- keymap("n", "<C-k>", "<C-w>k", opts)
  -- keymap("n", "<C-l>", "<C-w>l", opts)

  -- Better paste
  keymap("v", "p", '"_dP', opts)

  keymap("v", "J", ":m '>+1<CR>gv=gv")
  keymap("v", "K", ":m '<-2<CR>gv=gv")

  keymap("n", "J", "mzJ`z<cmd>delm z<CR>")
  keymap("n", "u", "u<cmd>delm z<CR>") -- to works well with marks
  keymap("n", "<C-d>", "<C-d>zz")
  keymap("n", "<C-u>", "<C-u>zz")
  keymap("n", "<C-f>", "<C-f>zz")
  keymap("n", "<C-b>", "<C-b>zz")
  keymap("n", "n", "nzzzv")
  keymap("n", "N", "Nzzzv")

  -- Find and Replace current word under cursor
  keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })

  -- delete to void
  keymap({ "n", "v" }, "<leader>d", [["_d]])

  -- copy just only use for mac
  keymap({ "n", "v" }, "<C-c>", [["+y]])

  keymap("n", "<leader>t", vim.cmd.TransparentToggle, opts)

  -- change to light mode
  keymap("n", "<leader>lm", "<cmd>colorscheme monokai-nightasty<CR>", opts)

  -- buffer management
  keymap("n", "qq", "<cmd>Bdelete this<CR>", opts)

  -- Lazy Git
  keymap("n", "<leader>lg", vim.cmd.LazyGit, opts)

  -- Mind Notes
  keymap("n", "<leader>n", "<cmd>Neorg index<CR>", opts)

  -- Toggle Terminal
  keymap("n", "<C-\\>", vim.cmd.ToggleTerm, opts)

  -- Toggle Terminal
  keymap("n", "<leader>ce", vim.cmd.TSContextEnable, opts)
  keymap("n", "<leader>ct", vim.cmd.TSContextToggle, opts)

  keymap("n", "<leader>/", "<cmd>lua require'telescope.builtin'.live_grep{ search_dirs={\"%:p\"} }<cr>")

  keymap("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
  keymap("n", "<leader><leader>", telescope.buffers, { desc = "[ ] Find existing buffers" })
  keymap("n", "<leader>sf", telescope.find_files, { desc = "[S]earch [F]iles" })
  keymap("n", "<leader>sh", telescope.help_tags, { desc = "[S]earch [H]elp" })
  keymap("n", "<leader>sw", telescope.grep_string, { desc = "[S]earch current [W]ord" })
  keymap("n", "<leader>sg", telescope.live_grep, { desc = "[S]earch by [G]rep" })
  keymap("n", "<leader>sd", telescope.diagnostics, { desc = "[S]earch [D]iagnostics" })

  keymap("n", "<leader>hh", telescope.highlights, { desc = "highlights" })

  -- Diagnostic keymaps
  keymap("n", "[d", vim.diagnostic.goto_prev)
  keymap("n", "]d", vim.diagnostic.goto_next)
  keymap("n", "<leader>df", vim.diagnostic.open_float)
  keymap("n", "<leader>q", vim.diagnostic.setloclist)

  -- Telescope File Browser
  keymap("n", "<leader>fb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true initial_mode=normal<CR>", opts)

  -- Toggle inlay hints
  keymap("n", "<leader>ih", function()
    vim.lsp.inlay_hint(0, nil)
  end)

  -- Toggle diagnostic
  local diagnostics_active = true
  vim.keymap.set("n", "<leader>da", function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
      vim.diagnostic.show()
    else
      vim.diagnostic.hide()
    end
  end)
end

M.harpoon_keymap = function(harpoon)
  keymap("n", "<leader>a", function() harpoon:list():append() end)

  local Path = require("plenary.path")
  local function normalize_path(buf_name, root)
    return Path:new(buf_name):make_relative(root)
  end
  keymap("n", "<C-e>", function()
    local ui_opts = {
      ui_fallback_width = 4,
      ui_width_ratio = 0.35,
    }
    local curr_file = normalize_path(vim.api.nvim_buf_get_name(0), vim.loop.cwd())
    harpoon.ui:toggle_quick_menu(harpoon:list(), ui_opts)
    local cmd = string.format("call search('%s')", curr_file)
    vim.cmd(cmd)
  end)
  keymap("n", "H", function() harpoon:list():next() end)
  keymap("n", "L", function() harpoon:list():prev() end)
end

M.hop_keymap = function()
  local hop = require("hop")
  local directions = require("hop.hint").HintDirection
  keymap("", "f", function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
  end, { remap = true })
  keymap("", "F", function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
  end, { remap = true })
  keymap("", "t", function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
  end, { remap = true })
  keymap("", "T", function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
  end, { remap = true })
  keymap("n", "s", vim.cmd.HopWord)
end

--  LSP
-- params as --> {keys, func, desc}
M.lsp_mappings = {
  { "<leader>r",  vim.lsp.buf.rename,                                               "[R]e[n]ame" },
  { "<leader>ca", vim.lsp.buf.code_action,                                          "[C]ode [A]ction" },
  { "gd",         vim.lsp.buf.definition,                                           "[G]oto [D]efinition" },
  { "gr",         telescope.lsp_references,                                         "[G]oto [R]eferences" },
  { "gI",         vim.lsp.buf.implementation,                                       "[G]oto [I]mplementation" },
  { "<leader>D",  vim.lsp.buf.type_definition,                                      "Type [D]efinition" },
  { "<leader>ds", telescope.lsp_document_symbols,                                   "[D]ocument [S]ymbols" },
  { "<leader>ws", telescope.lsp_dynamic_workspace_symbols,                          "[W]orkspace [S]ymbols" },
  { "gp",         "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "[G]oto [P]review" },
  { "gP",         "<cmd>lua require('goto-preview').close_all_win()<CR>",           "Clear Preview" },
  -- See `:help K` for why this keymap
  { "K",          vim.lsp.buf.hover,                                                "Hover Documentation" },
  { "<C-k>",      vim.lsp.buf.signature_help,                                       "Signature Documentation" },
  -- Lesser used LSP functionality
  { "gD",         vim.lsp.buf.declaration,                                          "[G]oto [D]eclaration" },
  { "<leader>wa", vim.lsp.buf.add_workspace_folder,                                 "[W]orkspace [A]dd Folder" },
  { "<leader>wr", vim.lsp.buf.remove_workspace_folder,                              "[W]orkspace [R]emove Folder" },
  {
    "<leader>wl",
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    "[W]orkspace [L]ist Folders",
  },
}

return M
