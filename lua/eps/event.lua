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

-- No relative Number on command mode
require("eps.colors")
autocmd("CmdlineEnter", {
  group = augroup("NoRnuCmdline"),
  callback = function ()
    vim.wo.relativenumber = false
    set_hl("LineNr", { fg = "#99a2b2" })
    cmd.redraw()
  end
})

autocmd("CmdlineLeave", {
  group = augroup("NoRnuCmdline"),
  callback = function ()
    vim.wo.relativenumber = true
    set_hl("LineNr", { fg = "yellow" })
  end
})
