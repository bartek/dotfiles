local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    cmd 'packadd packer.nvim'
  end
end

local function packer_startup()
  if packer == nil then
    packer = require'packer'
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'rebelot/kanagawa.nvim' -- colorscheme

  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'nvim-treesitter/nvim-treesitter-refactor'

  -- git
  use 'tpope/vim-fugitive'

  -- autocomplete and lsp support
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'

  -- statusline
  use 'echasnovski/mini.nvim'

  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  use 'zbirenbaum/copilot.lua'

  use 'ziglang/zig.vim'

  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommended if need floating window support

  use 'sebdah/vim-delve' -- go debug

  use 'bartek/epochconverter.nvim' -- my own little thing!

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  use {'prettier/vim-prettier', run = 'yarn install'} -- javascript prettier
end

local function init()
  packer_verify()
  packer_startup()
end

return {
  init = init
}
