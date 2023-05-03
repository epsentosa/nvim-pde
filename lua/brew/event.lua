local cmd = vim.cmd
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("LoadAlpha", { clear = true }),
  callback = function ()
    local args = vim.v.argv
    if #args == 2 then
      cmd('Alpha')
    end
  end
  }
)
