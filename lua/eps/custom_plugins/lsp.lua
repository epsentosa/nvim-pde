local signIcon = {
  ERROR = "",
  WARN = "",
  INFO = "",
  HINT = "",
}

--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  gopls = {
    gopls = {
      gofumpt = true, -- A stricter gofmt
      codelenses = {
        -- SEE: https://github.com/golang/tools/blob/master/gopls/doc/settings.md#code-lenses
        gc_details = true,     -- Toggle the calculation of gc annotations
        generate = true,       -- Runs go generate for a given directory
        regenerate_cgo = true, -- Regenerates cgo definitions
        test = true,           -- Runs go test for a specific set of test or benchmark functions
        tidy = true,           -- Runs go mod tidy for a module
        upgrade_dependency = true, -- Upgrades a dependency in the go.mod file for a module
        vendor = true,         -- Runs go mod vendor for a module
      },
      usePlaceholders = false,  -- enables placeholders for function parameters or struct fields in completion responses
      analyses = {
        -- SEE: https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
        -- fieldalignment = true, -- find structs that would use less memory if their fields were sorted
        nilness = true,    -- check for redundant or impossible nil comparisons
        -- shadow = true, -- check for possible unintended shadowing of variables
        unusedparams = true, -- check for unused parameters of functions
        unusedwrite = true, -- checks for unused writes, an instances of writes to struct fields and arrays that are never read
        useany = true,     -- check for constraints that could be simplified to "any"
      },
      staticcheck = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
  lua_ls = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      hint = {
        enable = true,
        arrayIndex = 'Disable',
        setType = true,
      },
    },
  },
}

-- local signature_setup = {
--   bind = true,
--   doc_lines = 0,
--   hint_enable = false,
--   floating_window_above_cur_line = false,
-- }

-- Setup neovim lua configuration
require("neodev").setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup({
  ui = { border = "rounded" },
})

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
  -- load lsp signature
  -- require "lsp_signature".on_attach(signature_setup, bufnr)
  -- load keymap
  local lsp_mappings =  require("eps.keymaps").lsp_mappings
  for _, params in ipairs(lsp_mappings) do
    local keys, func, desc = unpack(params)
    nmap(keys, func, desc)
  end
end

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      handlers = handlers,
    })
  end,
})

-- Add border on LspInfo command
require("lspconfig.ui.windows").default_options.border = "single"

-- special case not using mason due to anomali if using multiple environment
local lspconfig = require("lspconfig")
lspconfig.jedi_language_server.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
  init_options = {
    completion = {
      disableSnippets = true,
    },
  }
})
lspconfig.ruff_lsp.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
  init_options = {
    settings = {
      args = {
        "--extend-select=W,COM,ICN",
        "--ignore=E501,E722,COM812",
      },
    },
  },
})

-- groovy lsp setup
-- lspconfig.groovyls.setup{
--   capabilities = capabilities,
--   on_attach = on_attach,
--   handlers = handlers,
--   cmd = { "java", "-jar", "~/Documents/ekoputra/groovy/groovy-language-server-all.jar" },
--   filetypes = { "groovy" },
-- }
-- Handling clangd warning: multiple different client offset_encodings detected for buffer, this is not supported yet
capabilities.offsetEncoding = { "utf-16" }
lspconfig.clangd.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
})

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signIcon.ERROR,
      [vim.diagnostic.severity.WARN] = signIcon.WARN,
      [vim.diagnostic.severity.INFO] = signIcon.INFO,
      [vim.diagnostic.severity.HINT] = signIcon.HINT,
    },
  },
  float = {
    focusable = true,
    style = "minimal",
    source = "always",
    header = "",
    prefix = "",
  },
  update_in_insert = false,
  severity_sort = true,
})
