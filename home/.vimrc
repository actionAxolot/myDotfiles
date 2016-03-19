"--- Turn off vi compatibility ---"
let base16colorspace=256

"---fucking line endings
set ffs=unix
set rtp+=~/.fzf

"--- Have fd escape insert mode ---"
inoremap fd <Esc>

"------- Packages to use ------"
call plug#begin('~/.vim/bundle')

Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'xolox/vim-misc'
Plug 'ajh17/Spacegray.vim'
Plug 'ervandew/supertab'
Plug 'sjl/gundo.vim'
Plug 'junegunn/fzf.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-vinegar'
Plug 'elzr/vim-json'
Plug 'freitass/todo.txt-vim'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'

call plug#end()
"------- Packages to use ------"

syntax on
filetype on
filetype plugin indent on
filetype plugin on

"--- GUI window configurations ---"
set winaltkeys=no
set guioptions-=T
set guioptions-=r
set guioptions-=L

if has("mac")
    set guifont=Monaco\ Mono\ 10
elseif has("unix")
    set guifont=Ubuntu\ Mono\ 10
else
    set guifont=Inconsolata:h11
endif


"---Remap key---"
let mapleader = "\<space>"

"--- Movement
nnoremap j gj
nnoremap k gk

"---Fold Method---"
set foldmethod=indent
set foldlevel=99

"---compatibility and security---"
set modelines=0
set ttimeoutlen=100

"---Set Color Scheme---"
colorscheme spacegray

"---Tabs configuration---"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"---Vim editor settings---"
set modelines=5
set mousemodel=popup
set pastetoggle=<F2>
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=longest:full,full
set cursorline
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set nobackup
set noswapfile


"---Vim search improvements---"
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap ,, :noh<CR>

"---Vim Longlines mess---"
set textwidth=100
set formatoptions=qrn1

"---Mappings to show hidden characters---"
nmap <leader>fl :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"---Match it configuration---"
runtime macros/matchit.vim

set completeopt=menuone,longest,preview,menu

"---Window operations---"
set winminheight=0
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>ws <C-w>s<C-w>l
nnoremap <C-a>h <C-w>h
nnoremap <C-a>j <C-w>j
nnoremap <C-a>k <C-w>k
nnoremap <C-a>l <C-w>l

"--- buffer nav
nnoremap <C-f> :bnext<CR>
nnoremap <C-b> :bprev<CR>

"--- Gundo mappings ---"
map <leader>fg :GundoToggle<CR>

"---- fzf configs ---- "
" Files, Buffers, BTags, Blines, Ag, Lines :Bcommits, Commits
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>bf :Buffers<CR>
nnoremap <silent> <C-t> :BTags<CR>
nnoremap <silent> <leader>bl :BLines<CR>
nnoremap <silent> <leader>pa :Ag<CR>
nnoremap <silent> <leader>pl :Lines<CR>
nnoremap <silent> <leader>bc :BCommits<CR>
nnoremap <silent> <leader>pc :Commits<CR>


"---Store Backup files in a central place---"
set backup
set backupdir=~/tmp
set dir=~/tmp

"------ Misc. Bindings -----"
"- Codefolding remap -"
nnoremap <leader>fz za

"--- Create mappings to edit and source vimrc ---"
nmap <leader>vr :tabedit $MYVIMRC<CR>

"--- Neovim terminal stuff ----"
"tnoremap fd <C-\><C-n>

" Ultisnips conf
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


"--- Relative numbers settings
set relativenumber
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"--- Super tab conf
let g:SuperTabDefaultCompletionType = "context"

"--- NERDTree stuff
nnoremap <leader>wf :NERDTreeToggle<CR>


" --- Making clipboards play nice
map <leader>fy "+y
map <leader>fp "+p
