local luaplayground_path = "/Users/ekoputra/Documents/ekoputra/lua/playgroud.lua"
local set_lines = vim.api.nvim_buf_set_lines
local cmd = vim.cmd

local attach_in_buffer = function (bufnr)
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("LuaPlayground", { clear = true }),
    pattern = luaplayground_path,
    callback = function ()
      local append_data = function (_, data)
        if data then
          set_lines(bufnr, -1, -1, false, data)
          set_lines(bufnr, -2, -1, false, {}) -- delete empty last lines
        end
      end
      set_lines(bufnr, 0, -1, false, {'Lua-Playground output:'})
      set_lines(bufnr, -1, -1, false, {' '})
      vim.fn.jobstart({ "lua", luaplayground_path}, {
        stdout_buffered = true,
        on_stdout = append_data,
        on_stderr = append_data,
      })
    end
    }
  )
end

vim.api.nvim_create_user_command('LuaPlay',function ()
  cmd.edit(luaplayground_path)
  cmd.vsplit()
  local win = vim.api.nvim_get_current_win()
  local bufnr = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_win_set_buf(win, bufnr)
  cmd.wincmd('h')
  attach_in_buffer(bufnr)
  cmd.write()
end, {})
