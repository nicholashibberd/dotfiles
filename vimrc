set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim
" set the runtime path to include fzf
set rtp+=~/.fzf

"" filetype plugin indent on    " required
"" " To ignore plugin indent changes, instead use:
"" "filetype plugin on
""
"" " Put your non-Plugin stuff after this line


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'kchmck/vim-coffee-script'
Plug 'mtscout6/vim-cjsx'
Plug 'elmcast/elm-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-mix-format'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug 'yong1le/darkplus.nvim'

" Initialize plugin system
call plug#end()

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

" Remap accidental capitals
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

colorscheme darkplus

" Disable swap files
set noswapfile

set colorcolumn=100

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
\  ]
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

" Map Ctrl-p to FZF
nnoremap <silent> <C-p> :FZF<CR>
" Map Ctrl-a to Ag
nnoremap <silent> <C-a> :Ag<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
