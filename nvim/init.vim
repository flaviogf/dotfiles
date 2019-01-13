call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
call plug#end()

let mapleader="\<space>"
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-p> :Files<CR>
nmap <leader>d <Plug>(ale_fix)

let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }

set relativenumber
set number
colorscheme onedark
syntax on

