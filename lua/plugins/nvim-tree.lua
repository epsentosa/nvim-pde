local config = function ()
  -- import nvim-tree plugin safely
  local setup, nvimtree = pcall(require, "nvim-tree")
  if not setup then
    return
  end

  -- configure nvim-tree
  nvimtree.setup({
    hijack_netrw = false,
    view = {
      adaptive_size = true,
      width = 20,
    },
    update_focused_file = {
      enable = true,
    },
    git = {
      enable = false,
      ignore = false,
    },
    -- disable window_picker for
    -- explorer to work well with
    -- window splits
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
  })
end

return {
  'nvim-tree/nvim-tree.lua',
  config = config,
  cmd = 'NvimTreeToggle',
}
