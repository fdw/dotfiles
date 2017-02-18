set title
set history=1000
set noerrorbells
set novisualbell
set t_vb=
set modelines=0

" Backup and undo files
silent !mkdir ~/.cache/nvim/ > /dev/null 2>&1
set directory=~/.cache/nvim
set nobackup
set nowritebackup
silent !mkdir ~/.cache/nvim/undos > /dev/null 2>&1
set undodir=~/.cache/nvim/undos
set undofile
set undolevels=150
silent !find	~/.cache/nvim/undos/ -mtime +28 -exec rm -f {} \;

" Behavior
set hidden
set viewoptions=cursor,folds,slash,unix
set nrformats=hex
syntax enable
set lazyredraw

" UI
set ruler
set showmode
set linebreak
set showcmd
set showmatch
set relativenumber
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

" Search
set ignorecase
set smartcase
set infercase
set scrolloff=5
set gdefault
nnoremap <F12> :set hlsearch!<CR>

" Autocomplete
set wildmode=longest:full,full

" Set tabs
set shiftwidth=2
set tabstop=2

" Folding
set foldenable
set foldmethod=syntax
set foldnestmax=20
set foldlevelstart=20
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Plugins
filetype off
call plug#begin()
"" Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sgur/ctrlp-extensions.vim'
"" UI
Plug 'lifepillar/vim-solarized8'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-bufferline'
Plug 'kshenoy/vim-signature'
Plug 'nathanaelkane/vim-indent-guides'
"" Functionality
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
"" Filetypes
Plug 'elzr/vim-json', {'for': 'json'}

call plug#end()

" Included Macros
runtime macros/matchit.vim

" Filetype detection
filetype plugin indent on

" Plugin configuration
"" CtrlP
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/vim/ctrlp'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 'tj'
let g:ctrlp_tilde_homedir = 1
"" Airline
set fillchars+=stl:\ ,stlnc:\
let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme = 'solarized'
let g:airline_inactive_collapse = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"" Startify
silent !mkdir ~/.cache/vim/sessions > /dev/null 2>&1
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_session_dir = '~/.cache/vim/sessions'
let g:startify_list_order = [['Sessions'], 'sessions', ['Bookmarks'], 'bookmarks', ['MRUs'], 'files', ['Directory'], 'dir']
let g:startify_bookmarks = ['~/.config/dotfiles/zshrc','~/.config/dotfiles/nvimrc','~/.config/dotfiles/i3config']
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 1
let g:startify_custom_header = ['']
let g:startify_session_autoload = 1
"" Indent guides
let g:indent_guides_guide_size = 1
let g:indent_guides_space_guides = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:sneak#streak = 1
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1
let g:sneak#textobject_z = 0
"" Theme
set background=dark
colorscheme solarized8_dark_flat

" Printing
set printoptions+=header:0

set printexpr=PrintFile(v:fname_in)
function! PrintFile(fname)
	call system("lp " . a:fname)
	call delete(a:fname)
	return v:shell_error
endfunc

" Keymaps
let g:mapleader = "\<Space>"
"" Most frequent
nnoremap <Leader>w :w<CR>
"" Sensible j/k movements
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
"" This just makes sense
nnoremap H 0
nnoremap L $
"" Keymaps for command line
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <M-d> <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g> <C-c>
"" Adapt for qwertz
nnoremap , ;
nnoremap ; ,
nnoremap g, g;
nnoremap g; g;
nmap ö [
nmap ä ]
nmap ß /
vmap ß /
nmap Q @
vmap Q @
"" Moving through buffer, quickfix, location and tag lists
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>
nnoremap <silent> [t :tprevious<CR>
nnoremap <silent> ]t :tnext<CR>
nnoremap <silent> [T :tfirst<CR>
nnoremap <silent> ]T :tlast<CR>
nnoremap <silent> [c g;
nnoremap <silent> ]c g,
"" let Y behave like D
nnoremap Y y$
"" Use leader for system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
"" Jump to end of text after pasting
vnoremap <silent> p p`]
nnoremap <silent> p p`]
"" Sneaky
nnoremap r s
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S
nnoremap [s <Plug>SneakNext
nnoremap ]s <Plug>SneakPrevious
"" Buffer-independent stuff
nnoremap <F1> :CtrlPBuffer<CR>
nnoremap <F2> :CtrlPYankring<CR>
"" Buffer dependent stuff
nnoremap <F3> :CtrlPUndo<CR>
nnoremap <F4> :CtrlPTag<CR>
"" Opening files
nnoremap <F5> :CtrlP<CR>
nnoremap <F6> :CtrlP ~<CR>
"" Expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"" Easy alignment
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
