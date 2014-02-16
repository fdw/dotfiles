" General stuff
set nocompatible
set title
set lines=26 columns=104
set history=1000
set noerrorbells
set novisualbell
set t_vb=
set encoding=utf-8
set modelines=0

" Backup and undo files
silent !mkdir ~/.cache/vim/ > /dev/null 2>&1
set directory=~/.cache/vim
set nobackup
set nowritebackup
silent !mkdir ~/.cache/vim/undos > /dev/null 2>&1
set undodir=~/.cache/vim/undos
set undofile

" Behavior
set mouse=a
set backspace=indent,eol,start
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
set ttyfast
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase
set scrolloff=5
set gdefault
nnoremap <F3> :set hlsearch!<CR>

" Autocomplete
set wildmenu
set wildmode=longest:full,full

" History
set history=200

" Set tabs
set autoindent
set smarttab
set shiftwidth=4
set tabstop=4

" Folding
set foldmethod=indent
set foldnestmax=3
set foldenable
set foldlevelstart=20
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Spelling
set spelllang=en,de,es,fr
set spellfile=~/.local/share/vim/spellfile.utf-8.add
set spell

" Plugins
filetype off
set rtp+=~/.vim/bundle/neobundle.vim
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" Vimproc - NeoBundle and Unity use this for async
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
	\ 'windows' : 'make -f make_mingw32.mak',
	\ 'cygwin' : 'make -f make_cygwin.mak',
	\ 'mac' : 'make -f make_mac.mak',
	\ 'unix' : 'make -f make_unix.mak',
	\ },
	\ }
" Open files, buffers, previous yanks etc
NeoBundle 'Shougo/unite.vim'
	let $LC_NUMERIC = 'en_US.utf8'
	call unite#filters#sorter_default#use(['sorter_rank'])
	call unite#filters#matcher_default#use(['matcher_fuzzy'])
	call unite#set_profile('files', 'smartcase', 1)
	let g:unite_data_directory = '~/.cache/vim/unite'
	let g:unite_enable_start_insert = 1
	let g:unite_source_history_yank_enable = 1
	let g:unite_source_file_mru_filename_format = ':~:.'
	let g:unite_source_file_mru_limit = 1000
	let g:unite_source_history_yank_limit = 50
	" Exit faster
	au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
	au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
	" Support the Silver Searcher
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts = '--nocolor --nogroup'
	let g:unite_source_grep_recursive_opt = ''
	let g:unite_source_grep_max_candidates = 200
	"Keymaps
	nnoremap <F5> :Unite -auto-resize -resume -buffer-name=yanks history/yank<CR>
	nnoremap <F6> :Unite -auto-resize -resume -buffer-name=files file_mru file_rec/async buffer bookmark<CR>
	nnoremap <F7> :Unite -auto-resize -resume -buffer-name=files grep<CR>
NeoBundle 'justinmk/vim-sneak'
	let g:sneak#streak = 1
	let g:sneak#use_ic_scs = 1
	nnoremap r s
	nmap s <Plug>SneakForward
	nmap S <Plug>SneakBackward
	xmap s <Plug>VSneakForward
	xmap S <Plug>VSneakBackward
" Show a sidebar with the undo tree
NeoBundle 'sjl/gundo.vim'
	nnoremap <F9> :GundoToggle<CR>
" Show a sidebar with the current buffer's tags
NeoBundle 'majutsushi/tagbar'
	nnoremap <F10> :TagbarToggle<CR>
	let g:tagbar_type_markdown = {
		\ 'ctagstype' : 'markdown',
		\ 'kinds' : [
			\ 'h:Heading_L1',
			\ 'j:Heading_L2',
			\ 'k:Heading_L3',
			\ 'i:images',
			\ 'l:links'
		\ ]
		\ }
" Toggle commentaries
NeoBundle 'tpope/vim-commentary.git', {'depends': 'tpope/vim-repeat'}
" A text object based on the indentation
NeoBundle 'kana/vim-textobj-indent.git', {'depends': 'kana/vim-textobj-user'}
" Search for the visually selected text
NeoBundle 'nelstrom/vim-visual-star-search.git'
" Show the level of indentation
NeoBundle 'nathanaelkane/vim-indent-guides.git'
	let g:indent_guides_guide_size = 1
	let g:indent_guides_space_guides = 1
	let g:indent_guides_enable_on_vim_startup = 1
" Show marks in the gutter
NeoBundle 'kshenoy/vim-signature.git'
" Nicer start screen with last used buffers
NeoBundle 'mhinz/vim-startify.git'
	silent !mkdir ~/.cache/vim/sessions > /dev/null 2>&1
	let g:startify_session_dir = '~/.cache/vim/sessions'
	let g:startify_list_order = ['sessions', 'bookmarks', 'files', 'dir']
	let g:startify_bookmarks = ['~/.config/dotfiles/vimrc','~/.config/dotfiles/zshrc','~/.config/dotfiles/gitconfig']
	let g:startify_session_persistence = 1
	let g:startify_change_to_dir = 1
" Colorful statusline
NeoBundle 'bling/vim-airline', {'depends': 'tpope/vim-fugitive'}
	set laststatus=2
	set fillchars+=stl:\ ,stlnc:\
	let g:airline_symbols = {}
	let g:airline_left_sep = ''
	let g:airline_right_sep = ''
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.whitespace = 'Ξ'
	let g:airline#extensions#branch#enabled = 1
	let g:airline#extensions#tagbar#enabled = 1
	let g:airline_branch_prefix = '⎇ '
	let g:airline_theme = 'solarized'
	let g:airline_inactive_collapse = 1
" Solarized color scheme
NeoBundle 'altercation/vim-colors-solarized.git'
	set background=dark
	colorscheme solarized
" Better LaTeX support, only loaded for latex files
NeoBundleLazy 'LaTeX-Box-Team/LaTeX-Box'
	autocmd FileType plaintex,tex NeoBundleSource LaTeX-Box
" Support for markdown
NeoBundle 'tpope/vim-markdown'

" Included Macros
runtime macros/matchit.vim

" Filetype detection
filetype plugin indent on

" Printing
set printoptions+=header:0

set printexpr=PrintFile(v:fname_in)
function! PrintFile(fname)
	call system("lp " . a:fname)
	call delete(a:fname)
	return v:shell_error
endfunc

" Keymaps
let mapleader="-"
" Sensible j/k movements
noremap j gj
noremap k gk
" Keymaps for command line
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
" Adapt for qwertz
nnoremap , ;
nnoremap ; ,
nnoremap g, g;
nnoremap g; g;
nmap ö [
nmap ä ]
nmap ß /
vmap ß /
" Moving through buffer, quickfix, location and tag lists
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
" let Y behave like D
nnoremap Y y$
cmap W w !sudo tee > /dev/null %
