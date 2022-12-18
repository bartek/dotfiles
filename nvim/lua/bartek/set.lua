local g = vim.g
local opt = vim.opt

g.mapleader = ","

-- Indentation
opt.expandtab=true
opt.shiftwidth=4
opt.softtabstop=-1 -- -1 uses shiftwidth value
opt.shiftround=true -- indents to next multiple of shiftwidth

-- Adjust tab size for various filetypes
local file_indents = {
  {
    pattern='go',
    command='setlocal tabstop=4'
  },
  {
    pattern='yaml',
    command='setlocal tabstop=2'
  },
}

-- incremental search
opt.hlsearch=false
opt.incsearch=true
opt.scrolloff=8

-- Line wrapping
opt.linebreak=true
opt.breakindent=true -- keep indentation when wrapping lines

opt.virtualedit="all"
opt.showmode=false
opt.signcolumn='yes'
opt.foldlevel=99
opt.foldmethod='expr'
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldminlines=1
opt.foldnestmax=3

opt.listchars={
    tab="» ",
    trail="·",
    nbsp="␣",
    extends="❯",
    precedes="❮",
    eol="¬",
}
opt.list=true

opt.number=true
opt.relativenumber=true
opt.hidden=true -- allow switching buffers if there are unsaved changes
opt.updatetime=300

--require 'lua.bartek.packer'.init()
vim.cmd("colorscheme kanagawa")
