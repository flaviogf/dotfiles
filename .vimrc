call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
call plug#end()

colorscheme dracula

syntax on

set colorcolumn=120

set cursorline

set encoding=utf-8

set guifont=JetBrains\ Mono

set history=200

set ignorecase

set incsearch

set mouse=a

set nocompatible

set nowrap

set relativenumber
set number

set smartcase

set smartindent

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set wildmenu
set wildmode=full

let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'ruby': ['rubocop'] }
let g:ale_linters = { 'ruby': ['rubocop'] }
let g:ale_linters_explicit = 1

let g:airline#extensions#ale#enabled = 1

let mapleader = ','

augroup ruby
  autocmd!
  autocmd FileType ruby nnoremap <f5> :!ctags -R --languages=ruby --exclude=.git --exclude=log .<CR>
augroup END

nnoremap <leader>e :Vex<CR>
nnoremap <leader>f :ALEFix<CR>
nnoremap <leader>p :Files<CR>
