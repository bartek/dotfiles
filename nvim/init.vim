let g:mapleader = ","

" indentation
set expandtab
set shiftwidth=4
set softtabstop=-1
set shiftround

" Adjust tab size for various file types
autocmd Filetype go setlocal tabstop=4
autocmd Filetype yaml setlocal tabstop=2

" Line Wrapping
set linebreak
set breakindent " keep indentation when wrapping lines
set cpoptions+=n breakindentopt=sbr " display 'showbreak' symbol within the line number column

set virtualedit=all
set noshowmode
set signcolumn=yes
set foldlevel=99  " start unfolded by default
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set hidden " allow switching buffers even if there are unsaved changes
set updatetime=300

au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.go setlocal textwidth=80
au BufRead,BufNewFile *.zig setlocal textwidth=80

" Interface-affecting
nmap <leader>s :set spell!<CR>

" Toggle folding
nnoremap <space> za

" Builtin terminal
command! Term :bot sp | term
autocmd TermOpen term://* startinsert
tnoremap <expr> <Esc> &ft == 'fzf' ? '<Esc>' : '<C-\><C-n>'

set number
set relativenumber

" Toggle relativenumber in a few scenarios (e.g. when we leave insert mode)
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" -- F-keys navigation bindings

" Quickfix
noremap <F7> :cprevious<cr>
noremap <F8> :cnext<cr>

call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'

Plug 'folke/tokyonight.nvim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'bling/vim-airline'

Plug 'tpope/vim-fugitive'

Plug 'sebdah/vim-delve'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

Plug 'nvim-treesitter/nvim-treesitter-refactor'

Plug 'simrat39/symbols-outline.nvim'

Plug 'tpope/vim-surround'

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/completion-nvim'

Plug 'ziglang/zig.vim'

" Diagnostics enhanced
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/lsp-trouble.nvim'

call plug#end()

let base16colorspace=256  " Access colors present in 256 colorspace

let g:tokyonight_style = "night"
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

colorscheme tokyonight

" Navigation between buffers
nmap <leader>T :enew<CR>
nmap <leader>w :bnext<CR>
nmap <leader>b :bprevious<CR>
nmap <leader>bq :bp <Bar> bd #<CR>

" open new split panes to the bottom right
set splitright
set splitbelow

" use ctrl+hjkl to move between split/vsplit panels
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Abbreviations, mostly emojis

ab :tada: 🎉
ab :point_right: 👉
ab :bulb: 💡
ab :thinking: 🤔
ab :eyes: 👀
ab :memo: 📝

" -- fzf
nmap ; :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>l :Lines<CR>

let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = []

" -- vim-delve
nnoremap <leader>db :DlvBuild<cr>
nnoremap <leader>da :DlvAddBreakpoint<cr>
nnoremap <leader>dcl :DlvClearAll<cr>

" -- completion-nvim
let g:completion_confirm_key = "\<C-y>"
let g:completion_timer_cycle = 120 "default value is 80

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" -- vim-airline

" Show a list of buffers (on top)
let g:airline#extensions#tabline#enabled = 1

" -- nvim-lspconfig
lua require'lsp_setup'
lua require'zls_setup'
lua require'gofuncs'

" -- autocmd not available in Lua (as per above file) yet
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Don't run zig fmt on save.
" It's slow, for some reason
let g:zig_fmt_autosave = 0

" -- nvim-treesitter
lua require'treesitter_setup'

" -- symbols-outline.nvim
lua require'symbols_setup'

" -- trouble
nnoremap <leader>xx <cmd>LspTroubleToggle<cr>
nnoremap <leader>xw <cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>LspTroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>LspTroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>LspTroubleToggle loclist<cr>
nnoremap gR <cmd>LspTroubleToggle lsp_references<cr>
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
