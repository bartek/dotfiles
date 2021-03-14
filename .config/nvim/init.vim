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

au BufRead,BufNewFile *.md setlocal textwidth=90
au BufRead,BufNewFile *.go setlocal textwidth=90


" FIXME: This errors on newly created files
au BufWritePre *.go lua goimports(1000)

" Interface-affecting
nmap <leader>s :set spell!<CR>

" Toggle folding
nnoremap <space> za

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

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'bling/vim-airline'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'onsails/lspkind-nvim'

Plug 'tmsvg/pear-tree'

Plug 'sebdah/vim-delve'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

Plug 'nvim-treesitter/nvim-treesitter-refactor'

Plug 'tpope/vim-surround'

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/completion-nvim'

call plug#end()

syntax enable
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark

" Navigation between buffers
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>k :bprevious<CR>
nmap <leader>bq :bp <Bar> bd #<CR>


" open new split panes to the bottom right
set splitright
set splitbelow

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Abbreviations, mostly emojis

ab :tada: 🎉
ab :point_right: 👉
ab :bulb: 💡

" -- fzf
nmap ; :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>fl :Lines<CR>

let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = []

" -- vim-delve
nnoremap <leader>db :DlvBuild<cr>
nnoremap <leader>da :DlvAddBreakpoint<cr>
nnoremap <leader>dcl :DlvClearAll<cr>

" -- completion-nvim
let g:completion_confirm_key = "\<C-y>"
let g:completion_timer_cycle = 200 "default value is 80

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

" -- vim-gitgutter

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1

" -- nvim-lspconfig
lua require'lsp_setup'
lua require'gofuncs'

" -- autocmd not available in Lua (as per above file) yet
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" -- nvim-treesitter
lua require'treesitter_setup'

" -- lspkind-nvim
lua require'lspkind_setup'
