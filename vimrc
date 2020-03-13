set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim
" set the runtime path to include fzf
set rtp+=/usr/local/opt/fzf

" initialise Vundle
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
Plugin 'elmcast/elm-vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'dense-analysis/ale'
Plugin 'mhinz/vim-mix-format'
Plugin 'leafgarland/typescript-vim'
Plugin 'fatih/vim-go'
Plugin 'junegunn/fzf.vim'

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

" set the path to the directory that vim was opened from, to allow use of :find
set path=$PWD/**

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

" Highlight trailing whitespace in red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

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

" Run go import on save
let g:go_fmt_command = "goimports"

" Configure gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Run elm format on save
let g:elm_format_autosave = 1

" Run mix format on save
let g:mix_format_on_save = 1

" Set elm tabs to 4 spaces
au FileType elm setlocal ts=4 sts=4 sw=4 expandtab

"ALE linting
let g:ale_fixers = {
\  'ruby': [
\    'rubocop'
\  ],
\  'go': [
\    'gopls'
\  ],
\}
let g:ale_lint_on_insert_leave = 1


" Automatically set and unset paste when pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
