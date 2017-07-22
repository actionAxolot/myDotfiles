"--- Turn off vi compatibility ---"
let base16colorspace=256

"---fucking line endings
set ffs=unix
set rtp+=~/.fzf

"--- Have fd escape insert mode ---"
inoremap fd <Esc>

"------- Packages to use ------"
call plug#begin('~/.vim/bundle')

Plug 'vim-scripts/delimitMate.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'xolox/vim-misc'
Plug 'ajh17/Spacegray.vim'
Plug 'sjl/gundo.vim'
Plug 'junegunn/fzf.vim'
Plug 'neomake/neomake'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-cucumber'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'majutsushi/tagbar'
Plug 'mustache/vim-mustache-handlebars'

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
    set guifont=Source\ Code\ Pro\ 10
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

"---filetype identification---"
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c setlocal omnifunc=ccomplete#Complete

"---Indentation according to filetype---"
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

set completeopt=menuone,longest,preview,menu

"---Window operations---"
set winminheight=0
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>ws <C-w>s<C-w>l
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

"--- buffer nav
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>

"--- Gundo mappings ---"
map <leader>fg :GundoToggle<CR>

"---- fzf configs ---- "
" Files, Buffers, BTags, Blines, Ag, Lines :Bcommits, Commits
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>bf :Buffers<CR>
nnoremap <silent> <leader>bt :BTags<CR>
nnoremap <silent> <leader>bl :BLines<CR>
nnoremap <silent> <leader>pa :Ag<CR>
nnoremap <silent> <leader>pl :Lines<CR>
nnoremap <silent> <leader>bc :BCommits<CR>
nnoremap <silent> <leader>pc :Commits<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

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

" --- Making clipboards play nice
map <leader>fy "+y
map <leader>fp "+p

"----- Linting
autocmd! BufWritePost * Neomake

"----- deplete conf
let g:deoplete#enable_at_startup = 1

"---- Jedi config
let g:jedi#completions_enabled = 0

"---- Tagbar confs
nmap <leader><leader> :TagbarToggle<CR>

"---- FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
