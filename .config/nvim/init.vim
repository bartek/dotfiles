let g:mapleader = ","

" Indentation
set expandtab
set shiftwidth=4
set softtabstop=-1
set shiftround

" Adjust tab size for Go code to align with defined shiftwidth
autocmd Filetype go setlocal tabstop=4

" Line Wrapping
set linebreak
set cmdheight=2
set breakindent " keep indentation when wrapping lines
set cpoptions+=n breakindentopt=sbr " display 'showbreak' symbol within the line number column

set signcolumn=yes
set foldlevel=99  " start unfolded by default
set foldmethod=indent
set hidden " allow switching buffers even if there are unsaved changes
set updatetime=300

au BufRead,BufNewFile *.md setlocal textwidth=90
au BufRead,BufNewFile *.go setlocal textwidth=90

" Interface-affecting
nmap <leader>s :set spell!<CR>

" Toggle folding
nnoremap <space> za

set number

" -- F-keys navigation bindings

" Quickfix
noremap <F7> :cprevious<cr>
noremap <F8> :cnext<cr>

" Toggle coverage on open buffer
au FileType go nmap <F9> :GoCoverageToggle -short<cr>


call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'dracula/vim'

Plug 'dense-analysis/ale'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'bling/vim-airline'

Plug 'tpope/vim-fugitive'

Plug 'tmsvg/pear-tree'

call plug#end()

syntax enable
colorscheme dracula

" Buffers
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>k :bprevious<CR>
" Close the current buffer and move to the most recently viewed one.
nmap <leader>bq :bp <Bar> bd #<CR>

" open new split panes to the bottom right
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" -- fzf
nmap ; :Buffers<CR>
nmap <leader>f :Files<CR>

" let g:fzf_preview_window = 'right:60%'
let g:fzf_layout = { 'window': 'enew' }

augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" -- vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Highlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Jump to declaration/symbol
au FileType go nmap <leader>gt :GoDeclsDir<cr>


" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" goimports is basically gofmt + auto importing
" but it may be slow on large code bases. Proceeding with caution for now
let g:go_fmt_command = "goimports"

" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1

" -- vim-ale

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Use quickfix instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Autocompletion
let g:ale_completion_enabled = 1

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" -- vim-airline

" Show a list of buffers (on top)
let g:airline#extensions#tabline#enabled = 1
