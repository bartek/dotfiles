set guifont=Inconsolata:h14
colorscheme slate

" Default Window sizes and config.
set lines=60
set columns=200
set guioptions-=T " Hide the toolbar by default
set guioptions-=r

set title   " show title in console title bar

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

" Fixes stupid ^M issue with certain editors.
set ff=unix

" enter spaces when tab is pressed:
set expandtab

" do not break lines when line length increases
set textwidth=80
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" user 4 spaces to represent a tab
set tabstop=4
set softtabstop=4

" number of space to use for auto indent
set shiftwidth=4

" Copy indent from current line when starting a new line.
set autoindent
set smartindent

" makes backspace key more powerful.
set backspace=indent,eol,start
" shows the match while typing
set incsearch
" case insensitive search
set ignorecase
" show line and column number
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" show some autocomplete options in status bar
set wildmenu

" turns off the backup junk files that vim leaves. Files made whle Vim is open
" still stay
set nobackup

" set cursorline
syntax on

" Mappers!
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Common Typoes. This is kind of lame, but I never really have filenames
" with capital Q/W
cmap W w
cmap Q q

filetype on " enables filetype detection
filetype plugin on " enables filetype specific plugins

" F2 Runs Python on the Active file.
map <F2> :w\|!python %<cr>

" NERDTreee config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

"  " Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino

" LodgeIt (paste.pocoo.org) mapping
map ,p :Lodgeit<CR>

" Change leader key to , (default is \)
let mapleader = ","

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="
