-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('nvim-lualine/lualine.nvim') -- Fancier statusline
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use('tpope/vim-sleuth') -- Detect tabstop and shiftwidth automatically
  use('lukas-reineke/indent-blankline.nvim') -- Add indentation guides even on blank lines
  use('lewis6991/gitsigns.nvim')
  use('windwp/nvim-autopairs')
  use('xiyaowong/nvim-transparent')
  use {
    "kylechui/nvim-surround",
    config = function() require("nvim-surround").setup({}) end
  }
  use('mg979/vim-visual-multi') -- auto run, no need to setup

  -- startup
  use ("lewis6991/impatient.nvim") -- https://github.com/lewis6991/impatient.nvim

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")

  -- theme
  use('folke/tokyonight.nvim')
  use('catppuccin/nvim')
  use('Mofiqul/dracula.nvim')
  use('navarasu/onedark.nvim')
  use('tanvirtin/monokai.nvim')
  use('patstockwell/vim-monokai-tasty')

  --LSP
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }
  use('hrsh7th/cmp-buffer') -- source for text in buffer
  use('hrsh7th/cmp-path') -- source for file system paths

  use('onsails/lspkind.nvim')

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

end)
