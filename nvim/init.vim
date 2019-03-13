call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'joshdick/onedark.vim'
call plug#end()

let mapleader="\<space>"

nmap <C-n> :NERDTreeToggle<CR>

nmap <leader>d <Plug>(ale_fix)

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['isort', 'yapf'],
\}
let g:ale_fix_on_save = 1

set relativenumber
set number

colorscheme onedark
syntax on
