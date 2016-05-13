set nocompatible              " be iMproved, required
set backspace=indent,eol,start
filetype off                  " required

set t_Co=256
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'edkolev/tmuxline.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'urthbound/hound.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'terryma/vim-multiple-cursors'
call vundle#end()            " required
filetype plugin indent on
syntax on

let mapleader=","

set background=dark
let base16colorspace=256
colorscheme base16-ocean

set number
set hlsearch
set incsearch
set autoread
set nobackup
set noswapfile
set autoindent
set smartindent
set ignorecase
set smartcase
set fillchars=""
set autowriteall
set noerrorbells visualbell t_vb=
set showcmd

" splits the right way
set splitright
set splitbelow

" e Sane tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Always show vim-airline, even with no splits
set laststatus=2
let g:airline_powerline_fonts = 1

" Lower update time for git-gutter's sake
set updatetime=1000
let g:airline_theme='base16'

" JSX
let g:jsx_ext_required = 0

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_php_checkers=['php']
let g:syntastic_phpcs_conf = "--standard=/home/".expand($USER)."/development/Etsyweb/tests/standards/stable-ruleset.xml"
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html', 'css', 'scala', 'java', 'js'] }
let g:syntastic_javascript_checkers = ['eslint']

let g:hound_repos = "Etsyweb"
let g:hound_base_url = "hound.etsycorp.com"
let g:hound_port = "6080"
let g:hound_repo_paths = {
    \ "Etsyweb": "~/development/Etsyweb" }

" Mappings
nmap <Leader>ev :e $MYVIMRC<cr>         " ,ev to edit .vimrc
nmap <Leader>1 :NERDTreeToggle<cr>      " ,1 to toggle NERDTree
nmap <c-R> :BTags<cr>             " Ctrl-R to search symbols
nmap <c-E> :History<cr>           " Ctrl-E for recent files
nnoremap <Leader>e :Buffers<cr>           " Ctrl-tab for open buffers
nmap <Leader><space> :nohlsearch<cr>    " Clear search hilite
nmap <c-P> :Files<cr>                   " fzf filesearch
nmap <c-S> :w<cr>                       " Ctrl-S to save
noremap <leader>x :bd<CR>
noremap <leader>w :w<CR>

" Move lines up/down
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

nnoremap j gj
nnoremap k gk

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Autosource .vimrc after changes
augroup autosourcing
    autocmd!
    autocmd BufWritePost vimrc source %
    autocmd BufWritePre * StripWhitespace
augroup END
