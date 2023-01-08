local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- Faster load
  use 'lewis6991/impatient.nvim'

  -- Theme (https://github.com/shaunsingh/nord.nvim)
  use 'shaunsingh/nord.nvim'

  -- Status line (https://github.com/nvim-lualine/lualine.nvim)
  use 'nvim-lualine/lualine.nvim'

  -- A Vim plugin which shows a git diff in the
  -- sign column (https://github.com/airblade/vim-gitgutter)
  use 'airblade/vim-gitgutter'

  -- File explorer (https://github.com/nvim-tree/nvim-tree.lua)
  use 'kyazdani42/nvim-tree.lua'

  -- Toggle terminal
  use {
    "akinsho/toggleterm.nvim",
    tag = 'v2.*',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Highly extendable fuzzy finder over lists (https://github.com/nvim-telescope/telescope.nvim)
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0'
  }

  -- Lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jayp0521/mason-null-ls.nvim'
  use 'nvim-lua/lsp-status.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'

  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'


  if packer_bootstrap then
    require('packer').sync()
  end

end)
