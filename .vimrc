call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
call plug#end()

set encoding=utf-8
set guifont=JetBrains\ Mono
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
