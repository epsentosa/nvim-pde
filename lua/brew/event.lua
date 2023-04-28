vim.cmd([[
augroup LoadAlpha "entering nvim without open file
  autocmd!
  autocmd VimEnter * if empty(expand('%:t')) | execute 'Alpha' | endif
augroup END
]])
