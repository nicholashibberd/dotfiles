set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-commentary'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
"
" " Put your non-Plugin stuff after this line

nmap , \
vmap , \
" Shortcut to open/close NERDTree
map <Leader>n :NERDTreeToggle<CR>
" Highlight the current buffer (think of 'find')
map <Leader>f :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
" Prevent NERDTree from opening a new split-window
set buftype=

inoremap kj <ESC>

" Remap :W to :w
command W w

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number

" Highlight ruby operators (`/`, `&&`, `*`...)
let g:ruby_operators = 1

set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_underline=0
let g:solarized_italic=0
let g:solarized_bold=0
let g:solarized_contrast="high"
let g:solarized_visibility="high"
let g:solarized_termtrans=1

" Disable swap files
set noswapfile

set colorcolumn=80

" Toggle paste/nopaste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


set nowrap              " Don't wrap the display of long lines
set splitright          " Split new vertical windows right of current window
set splitbelow          " Split new horizontal windows under current window
