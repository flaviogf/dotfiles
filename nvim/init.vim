call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'joshdick/onedark.vim'
call plug#end()

" vim
let mapleader="\<space>"
colorscheme onedark
set encoding=utf-8
set relativenumber
set nowritebackup
set softtabstop=2
set shiftwidth=2
set smartindent
set noswapfile
set expandtab
set nobackup
set hlsearch
set nowrap
set number
syntax on

" nerdtree
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" alefix
nmap <leader>d <Plug>(ale_fix)
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['isort', 'yapf'],
\}
let g:ale_fix_on_save = 1
