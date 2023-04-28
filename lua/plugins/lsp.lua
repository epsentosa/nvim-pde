local config = function ()
  require('brew.keymaps')
  --  Add any additional override configuration in the following tables. They will be passed to
  --  the `settings` field of the server config. You must look up that documentation yourself.
  local servers = {
    pylsp = {
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

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    local handlers = {
      ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = false,
      }
      ),
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
