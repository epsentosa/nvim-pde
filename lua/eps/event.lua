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

-- Not using TreeSitter on sql file
autocmd( { "BufWinEnter" }, {
  pattern = "*.sql",
  callback = function ()
    cmd('TSDisable highlight')
  end
  }
)
