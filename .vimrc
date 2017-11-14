" Setup Vundle plugin manager

set hidden

call plug#begin()

" Prose writing
Plug 'junegunn/goyo.vim'

" Syntastic
Plug 'vim-syntastic/syntastic'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Rust Language
Plug 'rust-lang/rust.vim'

" gofmt, etc.
Plug 'fatih/vim-go'

" Autocomplete
Plug 'Valloric/YouCompleteMe'

" Silversearcher
Plug 'rking/ag.vim'

" Lean and mean statusbars.
Plug 'bling/vim-airline'

" Use signs to indicate added, modified, or removed lines.
Plug 'mhinz/vim-signify'

" Smarter tab, indent, expandtab.
Plug 'tpope/vim-sleuth'

" vim-markdown (https://github.com/plasticboy/vim-markdown)
Plug 'plasticboy/vim-markdown'

" All of your Plugs must be added before the following line
call plug#end()

"
filetype plugin indent on    " required

" Load .gvimrc aswell when MacVim is launched
if !exists("*ReloadConfigs")
  function ReloadConfigs()
      :source ~/.vimrc
      if has("gui_running")
          :source ~/.gvimrc
      endif
  endfunction
  command! Recfg call ReloadConfigs()
endif

colorscheme vividchalk

" set guifont=Inconsolata:h14
set guifont=Iosevka:h14

set statusline=%f

" --- Built in

set autoread
set backupdir=~/.vim/.backup
set directory=~/.vim/.swap
syntax on
set shell=/bin/bash

set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

" ----------
" let g:airline_section_error = airline#section#create_right(['ALE'])

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" Python Syntastic
let g:syntastic_python_checkers=['pylint']
let g:syntastic_python_python_exec='python3'

" Markdown/RST
let g:syntastic_rst_checkers=['sphinx']

" Javascript Syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_restructuredtext_checkers = []

" Distraction removal
set guioptions-=T " Hide the toolbar by default
set guioptions-=r " Hide the right scrollbar.
set laststatus=2
set noruler

set title   " show title in console title bar

" --------

" Turns on highlighted search function. Simply type / followed by search and
" hit enter
set hlsearch

" Set to display line numbers, yay
set number

" Stops the word highlighting from sticking on longer then you need it to
set nohls
" Enables incremenetal search
set incsearch
" Highlights matching brackets while typing
set showmatch
" Show me when I am in insert mode
set showmode

" Set minimium window width to 0
set wmh=0

" enter spaces when tab is pressed:
set expandtab

" do not break lines when line length increases
set textwidth=80
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

let mapleader=","

" let g:airline_theme = 'jellybeans'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Buffer Workflow
nmap <leader>T :enew<cr>

" Move to next buffer
nmap <leader>l :bnext<CR>

" Move to previous buffer
nmap <leader>k :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>


" Shortcut to toggle spell check
nmap <leader>s :set spell!<CR>

" Shortcut to tagbar.
nmap <leader>tg :TagbarToggle<CR>

"  " Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set list

" CtrlP Ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc|exe|so|dll)$',
  \ }

" Easily expand windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
" inoremap jk <ESC>
" inoremap jj <ESC>



" show line and column number
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" Copy indent from current line when starting a new line.
set autoindent
" set smartindent

" makes backspace key more powerful.
set backspace=indent,eol,start

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" -- Extra Delicious commands
command! Marked silent !open -a "Marked.app" "%:p"

" NERDTreee config
" let NERDTreeChDirMode=2
" let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
" let NERDTreeShowBookmarks=1
" map <F3> :NERDTreeToggle<CR>

" Better directory nav
" let g:netrw_liststyle = 3

" Ensures you can modify a directory listing (e.g. create a new file from it)
set modifiable

" pathogen.vim
execute pathogen#infect()

" Automatically lint on file save.
" autocmd BufWritePost *.py call Flake8()
" autocmd FileType python map <buffer> <leader>f :call Flake8()<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

let g:draftin_auth = "bart.ciszk@gmail.com:baldur"

" pdb in two keystrokes
map <Leader>p :call InsertPdb()<CR>

function! InsertPdb()
    let trace = expand("import pdb; pdb.set_trace()")
    execute "normal o".trace
endfunction

" YouCompleteMe mods.
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>

" vim-markdown
let g:vim_markdown_folding_disabled=1

" Change colour of hlsearch. Theme's is too low in contrast.
hi Search cterm=NONE ctermfg=black ctermbg=blue

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

let g:ycm_server_keep_logfiles = 1
let g:ycm_collect_identifiers_from_tags_files = 1

" Goto definition with F3
map <Leader>g :YcmCompleter GoTo<CR>

" fzf config
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=dark
  if !has('gui_running')
    let g:solarized_termcolors=256
  endif
  colors solarized
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>
