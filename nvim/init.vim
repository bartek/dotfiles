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
set foldminlines=1
set foldnestmax=3

set listchars=tab:»\ ,trail:·,nbsp:␣,extends:❯,precedes:❮,eol:¬
set list

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
" command! Term :bot sp | term
" command! Termv :bot vs | term
" autocmd TermOpen term://* startinsert
" tnoremap <expr> <Esc> &ft == 'fzf' ? '<Esc>' : '<C-\><C-n>'

" Builtin terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <C-t> :call TermToggle(12)<CR>
inoremap <C-t> <Esc>:call TermToggle(12)<CR>
tnoremap <C-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

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
" Symbols
noremap <F2> :SymbolsOutline<cr>
noremap <F3> :copen<cr>

call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'

Plug 'rebelot/kanagawa.nvim'

Plug 'feline-nvim/feline.nvim'
Plug 'mkitt/tabline.vim'

Plug 'tpope/vim-fugitive'

Plug 'sebdah/vim-delve'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

Plug 'nvim-treesitter/nvim-treesitter-refactor'

Plug 'simrat39/symbols-outline.nvim'

Plug 'tpope/vim-surround'

Plug 'neovim/nvim-lspconfig'

Plug 'L3MON4D3/luasnip'
Plug 'rafamadriz/friendly-snippets'

" Draw venn diagrams in neovim!
Plug 'jbyuki/venn.nvim'

" Completes words from the current buffer you're in
Plug 'hrsh7th/cmp-buffer'

" Help complete files
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'ziglang/zig.vim'

" Diagnostics enhanced
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'github/copilot.vim'

call plug#end()

let base16colorspace=256  " Access colors present in 256 colorspace

colorscheme kanagawa

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
ab :clap: 👏
ab :bulb: 💡
ab :thinking: 🤔
ab :eyes: 👀
ab :memo: 📝

" -- telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:fzf_layout =  { 'window' : { 'width': 0.9, 'height': 0.6, 'highlight': 'Normal' } }
let g:fzf_preview_window = []

" -- vim-delve
nnoremap <leader>db :DlvBuild<cr>
nnoremap <leader>da :DlvAddBreakpoint<cr>
nnoremap <leader>dcl :DlvClearAll<cr>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" -- nvim-lspconfig
lua require'lsp_setup'
lua require'zls_setup'
lua require'cmp_setup'
lua require'snippets'

" -- nvim-treesitter
lua require'treesitter_setup'

" -- symbols-outline.nvim
lua require'symbols_setup'

" -- venn.nvim
lua require'venn_setup'

" -- trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
lua << EOF
require("trouble").setup {
    height = 5,
    mode = "document_diagnostics",
    icons = false,
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}
EOF

" -- feline (statusbar)
lua require('feline').setup()
