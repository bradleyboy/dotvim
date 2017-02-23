set nocompatible              " be iMproved, required
set backspace=indent,eol,start
filetype off                  " required

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/webapi-vim'
Plug 'urthbound/hound.vim'
Plug 'chriskempson/base16-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'editorconfig/editorconfig-vim'
Plug 'DataWraith/auto_mkdir'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'mustache/vim-mustache-handlebars'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/nagios-syntax'
Plug 'jpalardy/vim-slime'
Plug 'reedes/vim-thematic'
Plug 'jnurmine/zenburn'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'Shougo/deoplete.nvim'
Plug 'padawan-php/deoplete-padawan'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'shawncplus/phpcomplete.vim'
Plug 'neomake/neomake'
Plug 'othree/jspc.vim'
call plug#end()            " required

filetype plugin indent on
syntax on
set cursorline
set scrolloff=3

" Activate deoplete by default
let g:deoplete#enable_at_startup = 1

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_functions = {}
"let g:deoplete#omni_patterns.php =
    "\ '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"let g:deoplete#omni_patterns.javascript = '[^. *\t]\.\w*'

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_php_enabled_makers = ['php', 'phpcs']
let g:neomake_php_phpcs_args_standard = "/home/".expand($USER)."/development/Etsyweb/tests/standards/stable-ruleset.xml"

let mapleader=","

set background=dark
let base16colorspace=256
"colorscheme base16-ocean

" Line numbers - Use relative line numbers except for current line
set relativenumber
set number

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

" Use system clipboard for yanks, deletes, puts
set clipboard+=unnamedplus

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline_right_sep = ''

function! AirlineInit()
    let g:airline_section_x = ''
    let g:airline_section_y = ''
    let g:airline_section_z = ''
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" JSX
let g:jsx_ext_required = 0
highlight link xmlEndTag xmlTag

let g:hound_repos = "Etsyweb"
let g:hound_base_url = "hound.etsycorp.com"
let g:hound_port = "6080"
let g:hound_repo_paths = {
    \ "Etsyweb": "~/development/Etsyweb" }

" automatically search for the word under our cursor
nmap <Leader>h :call HoundQF(expand('<cword>'))<cr>

" needed so you can jump to files from hound results
set path=.,/usr/include,/home/bdaily/development/Etsyweb,~/development/Etsyweb/phplib
set includeexpr=substitute(v:fname,'_','/','g')
set suffixesadd+=.php

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

" mustache abbreviations
let g:mustache_abbreviations = 1

let g:slime_target = "tmux"

let g:thematic#defaults = {
\ 'airline-theme': 'base16',
\ 'background': 'dark',
\ }

let g:thematic#themes = {
\ 'ocean': {'colorscheme': 'base16-ocean',
\          },
\ 'zen': {'colorscheme': 'zenburn',
\        },
\ 'material': {'colorscheme': 'hybrid_reverse',
\              'airline-theme': 'serene',
\             },
\ }

let g:thematic#theme_name = 'material'

" Mappings
nmap <Leader>ev :e $MYVIMRC<cr>
nmap <Leader>1 :NERDTreeToggle<cr>
nmap <Leader>f :NERDTreeFind<cr>
nmap <c-R> :BTags<cr>
nmap <c-E> :History<cr>
nnoremap <Leader>b :Buffers<cr>
nmap <Leader><space> :nohlsearch<cr>
nmap <c-P> :Files<cr>
nmap <c-S> :w<cr>
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
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" Sane window navigation
nnoremap <C-J> <C-W>j<C-W>_
nnoremap <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Creating file in current buffer's directory
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Open dev config
map <Leader>d :e /home/bdaily/development/Etsyweb/phplib/EtsyConfig/local_development.php<CR>

" Open development.php to CSTM section
map <Leader>dc :e +23263 /home/bdaily/development/Etsyweb/phplib/EtsyConfig/development.php<CR>

" Open production.php to CSTM section
map <Leader>dp :e +32279 /home/bdaily/development/Etsyweb/phplib/EtsyConfig/production.php<CR>

" Replace current word
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Quick indendation fix for the current line
nnoremap > <S-V>><Esc>
nnoremap < <S-V><<Esc>

" Autosource .vimrc after changes
augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim source %
    autocmd BufWritePre * StripWhitespace
    autocmd BufEnter,BufWritePost * Neomake
augroup END

"
" MACROS
"

" Convert node requires to ES6 imports
let @e='0ciwimportf=ciwfromwdf(f)xj'

let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
