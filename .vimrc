call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/vim-emoji'
Plug 'tomasr/molokai'
Plug 'w0rp/ale'
call plug#end()

let mapleader=','

colorscheme molokai

set encoding=utf-8
set guifont=Fira\ Code
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

nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

nmap <leader>f <Plug>(ale_fix)
let g:ale_sign_error = emoji#for('exclamation')
let g:ale_sign_warning = emoji#for('question')
let g:ale_fix_on_save = 1
let g:ale_fixers = {'javascript': ['eslint', 'prettier'], '*': ['remove_trailing_lines', 'trim_whitespace']}