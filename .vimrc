set nocompatible
filetype off


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'morhetz/gruvbox'  " colorscheme gruvbox
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
 
set tabstop=4     " a tab is four spaces
set smarttab
set expandtab
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
" set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set scrolloff=7
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  " case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  " shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set showcmd

set ttyfast
set lazyredraw
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile 
filetype plugin indent on
set pastetoggle=<F2>
set mouse=a
set mousehide
syntax on


" using russian layout
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
inoremap <C-l> <C-^>

" nnoremap <esc> :noh<cr><esc>
nnoremap ,<space> :nohlsearch<cr>

inoremap jj <esc>

" move lines up and down
nnoremap <C-k> <Up>ddp<Up>
nnoremap <C-j> ddp

colorscheme gruvbox
set background=dark


