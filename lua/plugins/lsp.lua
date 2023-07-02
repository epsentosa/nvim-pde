local config = function ()
  --  Add any additional override configuration in the following tables. They will be passed to
  --  the `settings` field of the server config. You must look up that documentation yourself.
  local servers = {
    gopls = {
      gopls = {
        analyses = { unusedparams = true },
        staticcheck = true,
      },
    },
    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
    jdtls = {},
  }

  -- Setup neovim lua configuration
  require('neodev').setup()
  --
  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  -- Setup mason so it can manage external tooling
  require('mason').setup({
    ui = { border = "rounded" }
  })

  local handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = false,
      }
    ),
    ["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = "rounded",
      }
    ),
  }

  local navic = require("nvim-navic")

  local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
    local nmap = function(keys, func, desc)
      if desc then desc = 'LSP: ' .. desc end
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    -- load keymap
    require('brew.keymaps')
    for _, params in ipairs(lsp_mappings) do
      local keys, func, desc = unpack(params)
      nmap(keys, func, desc)
    end
    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format({ timeout_ms = 10000 })
    end, { desc = 'Format current buffer with LSP' })
  end

  -- Ensure the servers above are installed
  local mason_lspconfig = require 'mason-lspconfig'

  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
  }

  mason_lspconfig.setup_handlers {
    function(server_name)
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
        handlers = handlers,
      }
    end,
  }

  -- Handling clangd warning: multiple different client offset_encodings detected for buffer, this is not supported yet
  capabilities.offsetEncoding = { "utf-16" }
  require('lspconfig').clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
  })

  -- Add border on LspInfo command
  require('lspconfig.ui.windows').default_options.border = 'single'

  -- Change Sign Symbol
  local function lspSymbol(name, icon)
    vim.fn.sign_define(
    'DiagnosticSign' .. name,{
      text = icon,
      numhl = 'DiagnosticDefault' .. name,
      texthl = 'DiagnosticSign' .. name
      }
    )
  end
  lspSymbol('Error', '')
  lspSymbol('Info', '')
  lspSymbol('Hint', '')
  lspSymbol('Info', '')
  lspSymbol('Warn', '')

  -- special case not using mason due to anomali if using multiple environment
  local lspconfig = require('lspconfig')
  lspconfig.pylsp.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enabled = true },
          -- pylint = {enabled = false},
          autopep8 = { enabled = true },
          -- yapf = {enabled = false},
          mccabe = { enabled = true },
          pycodestyle = { enabled = false },
          -- rope_completion = { enabled = true },
          -- rope_autoimport = {
            --   enabled = true,
            --   memory = true,
            -- },
          },
        },
      },
    handlers = handlers,
  }

end

return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim'
  },
  event = { "BufReadPre", "BufNewFile" },
  config = config,
}
