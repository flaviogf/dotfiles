call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
Plug 'janko-m/vim-test'
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
nmap <leader>f <Plug>(ale_fix)
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'python': ['isort', 'autopep8', 'remove_trailing_lines', 'trim_whitespace'],
\}

" jedi
let g:jedi#completions_command = "<C-N>"

" vim-test
let test#python#runner = 'pytest'
let test#strategy = 'neovim'
