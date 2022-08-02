packadd minpac

call minpac#init()

call minpac#add('airblade/vim-gitgutter')
call minpac#add('dracula/vim')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('mhinz/vim-grepper')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('vim-airline/vim-airline')

colorscheme dracula

filetype plugin indent on
syntax on

set clipboard=unnamedplus

set colorcolumn=80,120

set cursorline

set encoding=utf-8

set hidden

set history=200

set ignorecase

set incsearch

set mouse=a

set nocompatible

set nowrap

set omnifunc=syntaxcomplete#Complete

set relativenumber
set number

set smartcase

set smartindent

set splitbelow
set splitright

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set wildmenu
set wildmode=full

let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']

let mapleader = ','

nnoremap <leader>p :Files<CR>