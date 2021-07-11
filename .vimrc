call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
call plug#end()

colorscheme dracula

syntax on

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set wildmenu
set wildmode=full

set history=200

set encoding=utf-8
set guifont=JetBrains\ Mono
set relativenumber
set nowritebackup
set smartindent
set noswapfile
set nobackup
set hlsearch
set nowrap
set number

let mapleader = '\'

let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos = "right"

let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'ruby': ['rubocop'] }
let g:ale_linters = { 'ruby': ['rubocop'] }
let g:ale_linters_explicit = 1

let g:airline#extensions#ale#enabled = 1

nnoremap <leader>b :NERDTreeToggle<CR>
nnoremap <leader>f :ALEFix<CR>
nnoremap <leader>p :FZF<CR>
