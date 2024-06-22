" This config is not very important to me. It is simply sane
" defaults that I would like to have in the event that I
" need to use vim in any situation, or that I need to port
" this config to an application that supports vim motions.

colorscheme desert
filetype plugin indent on

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" [[ Options ]]
set number
set foldcolumn=1
set mouse="a"
set breakindent
set guicursor="n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

set ignorecase
set smartcase
set hlsearch

set autoread
set clipboard="unnamedplus"
if has('persistent_undo')
    set undodir=$HOME/.vim/undo
    set undofile
endif
set completeopt="menuone,noselect"

set termguicolors
set scrolloff=8

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set wrap

" [[ Remaps ]]
nmap gt :Ex<cr>

" half-page jumping but stay centered
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" search terms stay centered
nnoremap n nzzzv
nnoremap N Nzzzv

" For long, wrapped lines
nnoremap k gk
nnoremap j gj

nnoremap Q <Nop>
