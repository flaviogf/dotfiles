packadd minpac

call minpac#init()

call minpac#add('airblade/vim-gitgutter')
call minpac#add('dracula/vim')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('fatih/vim-go')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('mhinz/vim-grepper')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('sebdah/vim-delve')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-projectionist')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('vim-test/vim-test')
call minpac#add('w0rp/ale')

call minpac#add('ryanoasis/vim-devicons')

colorscheme dracula

filetype plugin indent on

syntax on

set clipboard=unnamedplus

set colorcolumn=80,120

set cursorline

set encoding=utf-8

set guifont=FiraCode\ Nerd\ Font\ Medium\ 18

set hidden

set history=200

set ignorecase

set incsearch

set listchars=tab:▸\ ,eol:¬

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

let g:ale_linters_explicit = 1

let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']

let test#neovim#term_position = 'vert'
let test#strategy = 'neovim'

let mapleader = ','

nnoremap <leader>e :Explore<CR>
nnoremap <leader>ve :Vex<CR>

nnoremap <leader>f :ALEFix<CR>

nnoremap <leader>p :Files<CR>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
