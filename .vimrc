packadd minpac

call minpac#init()

call minpac#add('airblade/vim-gitgutter')
call minpac#add('dracula/vim')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('mattn/emmet-vim')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('vim-airline/vim-airline')
call minpac#add('w0rp/ale')

colorscheme dracula

syntax on

set clipboard=unnamedplus

set colorcolumn=80,120

set cursorline

set encoding=utf-8

set guifont=JetBrains\ Mono:h18

set history=200

set ignorecase

set incsearch

set listchars=tab:▸\ ,eol:¬

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

augroup c
  autocmd!
  autocmd FileType c nnoremap <f5> :!ctags -R --languages=c --exclude=.git --exclude=log .<CR>
augroup END

nnoremap <leader>e :Explore<CR>
nnoremap <leader>ve :Vex<CR>
nnoremap <leader>f :ALEFix<CR>
nnoremap <leader>p :Files<CR>
