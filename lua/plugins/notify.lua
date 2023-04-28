local config = function ()
 require('notify').setup{
   fps = 120,
   render = "default",
   stages = "slide",
  }
end

return {
  'rcarriga/nvim-notify',
  config = config,
}
