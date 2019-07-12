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
set number
:set guicursor=

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
call plug#begin('~/.local/share/nvim/plugged')
"" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"" UI
Plug 'iCyMind/NeoSolarized'
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
Plug 'junegunn/vim-easy-align'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-sleuth'
Plug 'wellle/targets.vim'
"" Filetypes
Plug 'elzr/vim-json', {'for': 'json'}

call plug#end()

" Included Macros
runtime macros/matchit.vim

" Filetype detection
filetype plugin indent on

" Plugin configuration
"" fzf
command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
			\   <bang>0 ? fzf#vim#with_preview('up:60%')
			\           : fzf#vim#with_preview('right:50%:hidden', '?'),
			\   <bang>0)
command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
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
let g:startify_bookmarks = ['~/.config/dotfiles/zsh/rc','~/.config/dotfiles/nvimrc','~/.config/dotfiles/i3/config']
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
colorscheme NeoSolarized

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
nnoremap <silent> [p {<CR>
nnoremap <silent> ]p }<CR>
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
nnoremap <F1> :Buffers<CR>
"" Buffer dependent stuff
"" Opening files
nnoremap <F5> :Files ~<CR>
nnoremap <F6> :Files .<CR>
"" Easy alignment
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
