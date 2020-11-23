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

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'bling/vim-airline'

Plug 'tpope/vim-fugitive'

Plug 'tmsvg/pear-tree'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif



call plug#end()

syntax enable
colorscheme dracula

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

" -- fzf
nmap ; :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>fl :Lines<CR>

let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = []

" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'go': ['gopls'],
    \ }

" Specific configuration for .go files via LSP
function SetLSPShortcuts()

  autocmd BufWritePre .go :call LanguageClient#textDocument_formatting_sync()

  " Go to definition
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

  " Buffer-wide rename
  nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>

  " Documentation hover
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

  " References
  nnoremap <silent> lx :call LanguageClient#textDocument_references()<CR>

  " Symbol search
  nnoremap <silent> ls :call LanguageClient_textDocument_documentSymbol()<CR>

  " Other options available, currently not configured:
  " LanguageClient_workspace_applyEdit()
  " LanguageClient#textDocument_completion()
  " LanguageClient#textDocument_formatting()
  " LanguageClient_contextMenu()
  " LanguageClient#textDocument_typeDefinition()
endfunction()

augroup LSP
  autocmd!
  autocmd FileType go call SetLSPShortcuts()
augroup END

" Don't use virtualtext as it can be distracting
let g:LanguageClient_useVirtualText = "CodeLens"

" -- deoplete
" Completion manager which pairs nicely with LanguageClient-neovim
" https://github.com/autozimu/LanguageClient-neovim/wiki/Recommended-Settings
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('auto_complete_delay', 400)

" Use tab to autocomplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

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
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
