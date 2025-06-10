---@brief
---
--- https://github.com/golang/tools/tree/master/gopls
---
--- Google's lsp server for golang.

local mod_cache = nil

---@param fname string
---@return string?
local function get_root(fname)
  if mod_cache and fname:sub(1, #mod_cache) == mod_cache then
    local clients = vim.lsp.get_clients { name = 'gopls' }
    if #clients > 0 then
      return clients[#clients].config.root_dir
    end
  end
  return vim.fs.root(fname, 'go.work') or vim.fs.root(fname, 'go.mod') or vim.fs.root(fname, '.git')
end

return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    -- see: https://github.com/neovim/nvim-lspconfig/issues/804
    if mod_cache then
      on_dir(get_root(fname))
      return
    end
    local cmd = { 'go', 'env', 'GOMODCACHE' }
    vim.system(cmd, { text = true }, function(output)
      if output.code == 0 then
        if output.stdout then
          mod_cache = vim.trim(output.stdout)
        end
        on_dir(get_root(fname))
      else
        vim.schedule(function()
          vim.notify(('[gopls] cmd failed with code %d: %s\n%s'):format(output.code, cmd, output.stderr))
        end)
      end
    end)
  end,
  settings = {
    gopls = {
      gofumpt = true, -- A stricter gofmt
      codelenses = {
        -- SEE: https://github.com/golang/tools/blob/master/gopls/doc/settings.md#code-lenses
        gc_details = false,    -- Toggle the calculation of gc annotations
        generate = true,       -- Runs go generate for a given directory
        regenerate_cgo = true, -- Regenerates cgo definitions
        test = true,           -- Runs go test for a specific set of test or benchmark functions
        tidy = true,           -- Runs go mod tidy for a module
        upgrade_dependency = true, -- Upgrades a dependency in the go.mod file for a module
        vendor = true,         -- Runs go mod vendor for a module
      },
      usePlaceholders = false, -- enables placeholders for function parameters or struct fields in completion responses
      analyses = {
        -- SEE: https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
        -- fieldalignment = true, -- find structs that would use less memory if their fields were sorted
        nilness = true,  -- check for redundant or impossible nil comparisons
        -- shadow = true, -- check for possible unintended shadowing of variables
        unusedparams = true, -- check for unused parameters of functions
        unusedwrite = true, -- checks for unused writes, an instances of writes to struct fields and arrays that are never read
        useany = true,   -- check for constraints that could be simplified to "any"
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
  }
}
