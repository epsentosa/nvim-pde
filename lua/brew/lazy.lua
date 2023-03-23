local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
   {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = {{'nvim-lua/plenary.nvim'}}
  },

  ('theprimeagen/harpoon'),
  ('nvim-lualine/lualine.nvim'), -- Fancier statusline
   'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  ('lukas-reineke/indent-blankline.nvim'), -- Add indentation guides even on blank lines
  ('lewis6991/gitsigns.nvim'),
  ('windwp/nvim-autopairs'),
  ('xiyaowong/nvim-transparent'),
  {"kylechui/nvim-surround"},
  ('stevearc/stickybuf.nvim'),
  {'norcalli/nvim-colorizer.lua'},
  {'akinsho/toggleterm.nvim'},

  -- outline
  ('simrat39/symbols-outline.nvim'),

  -- Bufferline
  --  {'akinsho/bufferline.nvim'}
  {
    'kdheepak/tabline.nvim',
    -- dependencies = {
    --   {'hoob3rt/lualine.nvim', opt = true},
    --   {'kyazdani42/nvim-web-devicons', opt = true}
    -- }
  },
  -- delete buffer
   'Asheq/close-buffers.vim',

  -- file explorer
  ("nvim-tree/nvim-tree.lua"),

  -- vs-code like icons
  ("nvim-tree/nvim-web-devicons"),

  -- theme
  ('folke/tokyonight.nvim'),
  ('catppuccin/nvim'),
  ('Mofiqul/dracula.nvim'),
  ('navarasu/onedark.nvim'),
  ('tanvirtin/monokai.nvim'),
  ('patstockwell/vim-monokai-tasty'),

  -- lazygit
   'kdheepak/lazygit.nvim',

  -- LSP
   { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim'
    }
  },

   { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip'
    }
  },
  ('hrsh7th/cmp-buffer'), -- source for text in buffer
  ('hrsh7th/cmp-path'), -- source for file system paths
  ('hrsh7th/cmp-nvim-lua'), -- source for file lua nvim

  ('onsails/lspkind.nvim'),

  -- Formatter
  ('jose-elias-alvarez/null-ls.nvim'),

  -- Highlight, edit, and navigate code
   {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update {with_sync = true})
    end
  },
   'nvim-treesitter/nvim-treesitter-context',

  -- go programming
   { 'ray-x/go.nvim', ft = "go" },
   { 'ray-x/guihua.lua', ft = "go" },

   { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter'
  },

  -- for taking notes
   {'phaazon/mind.nvim', branch = 'v2.2'},

  -- java development
   {'mfussenegger/nvim-jdtls', ft = {"java"}},
}


local opts = {
    default = {
        lazy = true,
    },
    ui = {
        size = { width = 0.5, height = 0.5 },
        border = "rounded",
    }
}

require("lazy").setup(plugins, opts)
