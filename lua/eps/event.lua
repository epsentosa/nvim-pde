local autocmd = vim.api.nvim_create_autocmd
local augroup = function (group_name, opts)
  if opts then
    return vim.api.nvim_create_augroup(group_name, opts)
  else
    return vim.api.nvim_create_augroup(group_name, { clear = false })
  end
end
local cmd = vim.cmd

-- Load Alpha when not given args
autocmd("VimEnter", {
  group = augroup("LoadAlpha", { clear = true }),
  callback = function ()
    local args = vim.v.argv
    if #args == 2 then
      cmd('Alpha')
    end
  end
  }
)

-- Reset marks each start open neovim
autocmd({ "BufRead" }, { command = ":delm a-zA-Z0-9", })

autocmd({ "TextYankPost" }, {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
  }
)

-- Not using TreeSitter on sql file
autocmd( { "BufWinEnter" }, {
  pattern = "*.sql",
  callback = function ()
    cmd('TSDisable highlight')
  end
  }
)

autocmd("LspAttach", {
  group = augroup("lsp-attach", { clear = true }),
  callback = function(event)
    -- NOTE: Remember that Lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don"t have to repeat yourself.

    local nmap = function(keys, func, desc)
      if desc then
        desc = "LSP: " .. desc
      end
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
    end
    -- load lsp signature
    -- require "lsp_signature".on_attach(signature_setup, bufnr)
    -- load keymap
    local keymaps = require("eps.keymaps")
    for _, params in ipairs(keymaps.lsp_mappings) do
      local keys, func, desc = unpack(params)
      nmap(keys, func, desc)
    end

    local function client_supports_method(client, method, bufnr)
      return client:supports_method(method, bufnr)
    end

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed

    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentSymbol, event.buf) then
      require("nvim-navic").attach(client, event.buf)
    end

    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = augroup("lsp-highlight", { clear = false })
      autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      autocmd("LspDetach", {
        group = augroup("lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
        end,
      })
    end

    -- The following code creates a keymap to toggle inlay hints in your
    -- code, if the language server you are using supports them

    -- This may be unwanted, since they displace some of your code
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      keymaps.inlay_hints(event.buf)
    end
  end
})
