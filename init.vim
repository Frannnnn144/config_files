" INIT.VIM

set nocompatible
set mouse=a
set clipboard+=unnamedplus

filetype on
filetype plugin on
filetype indent on

syntax on
set termguicolors

set number
set relativenumber

set cursorline

set shiftwidth=4
set tabstop=4
set expandtab

set nobackup

set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000

set wildmenu
set wildmode=list:longest
" set wildignore=...

" PLUGINS -----------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

    Plug 'sheerun/vim-polyglot'
    Plug 'dense-analysis/ale' " asynchronous lint engine
    Plug 'preservim/nerdtree' " file manager

    " Colorschemes
    Plug 'morhetz/gruvbox' " gruvbox
    Plug 'iCyMind/NeoSolarized' " NeoSolarized
    Plug 'joshdick/onedark.vim' " onedark
    Plug 'folke/tokyonight.nvim' " tokyonight-{night,storm,day,moon}

call plug#end()

set background=dark
colorscheme tokyonight-night

" MAPPINGS ----------------------------------------------------

inoremap jj <Esc>

nnoremap <space> :

nnoremap o o<esc>
nnoremap O O<esc>

" to navigate better in split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" to resize split windows
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Map the F1 key to toggle NERDTree open and close.
nnoremap <F1> :NERDTreeToggle<cr>

" VIMSCRIPT ---------------------------------------------------

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline 
    autocmd WinEnter * set cursorline 
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')
    set background=dark
    colorscheme NeoSolarized

    set guifont=JetBrainsMono Nerd Font\ Regular\ 10
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=m
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>
endif


" STATUSLINE --------------------------------------------------

set statusline=

set statusline+=\ %F\ %M\ %Y\ %R

set statusline+=%=

set statusline+=\ %l\,\%c\ \ \ %p%%\ 

set laststatus=2
