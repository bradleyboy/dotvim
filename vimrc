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
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'DataWraith/auto_mkdir'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mileszs/ack.vim'
call vundle#end()            " required
filetype plugin indent on
syntax on

let mapleader=","

set background=dark
let base16colorspace=256
colorscheme base16-ocean

set number " show line numbers
set hlsearch " highlight search
set incsearch " search incrementally
set autoread " automatically read changes from the filesystem

" Turn off backups and their ilk
set nobackup
set noswapfile

" Smart indentation
set autoindent
set smartindent

" Ignore case when searching
set ignorecase
" Ignore case only when pattern is all lowercase
set smartcase

" Turn off the ugly pipes separating splits
set fillchars=""

" Automatically write when overwriting a buffer. #yolo
set autowriteall

" No bells, visual or otherwise
set noerrorbells visualbell t_vb=

" Show the cmd at the bottom of the screen
set showcmd

" splits the right way
set splitright
set splitbelow

" e Sane tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Ensure file saves get picked up properly by webpack, et al
set backupcopy=yes

" Lower update time for git-gutter's sake
set updatetime=1000

" Always show status
set laststatus=2

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

" JSX
let g:jsx_ext_required = 0
highlight link xmlEndTag xmlTag

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

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

" ack.vim
" Use silver searcher if available
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

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
nnoremap j gj
nnoremap k gk
nnoremap ; :
inoremap jj <ESC>
inoremap kk <ESC>:w<CR>
" map 0 to first non-blank character
map 0 ^
" b/c shift-4 is not comfortable
map 4 $

" Move lines up/down
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" Sane window navigation
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Autosource .vimrc after changes
augroup autosourcing
    autocmd!
    autocmd BufWritePost vimrc source %
    autocmd BufWritePre * StripWhitespace
augroup END

"
" MACROS
"

" Convert node requires to ES6 imports
let @e='0ciwimportf=ciwfromwdf(f)xj'
