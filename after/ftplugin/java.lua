local set = vim.opt_local
set.expandtab = true
set.tabstop = 4

local jdtls = require("jdtls")

local jdtls_capability = jdtls.extendedClientCapabilities
jdtls_capability.resolveAdditionalTextEditsSupport = true

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  }),
}

local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  local lsp_mappings =  require("eps.keymaps").lsp_mappings
  for _, params in ipairs(lsp_mappings) do
    local keys, func, desc = unpack(params)
    nmap(keys, func, desc)
  end
end

local config = {
  cmd = {'/usr/local/bin/jdtls'},
  root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
  single_file_support = true,
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = {
    java = {
      implementationsCodeLens = { enabled = true },
      inlayhints = {
        parameterNames = { enabled = true },
      },
      referencesCodeLens = { enabled = true },
      saveActions = { organizeImports = true },
      signatureHelp = { enabled = true },
      symbols = {
        includeSourceMethodDeclarations = true,
      },
    }
  },
  init_options = {
    extendedClientCapabilities = jdtls_capability,
  },
}
require('jdtls').start_or_attach(config)
