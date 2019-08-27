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

" UI
set ruler
set showmode
set linebreak
set showcmd
set showmatch
set number
:set guicursor=

" Buffer-independent stuff
nnoremap <F1> :Buffers<CR>
" Buffer dependent stuff
" Opening files
nnoremap <F5> :Files ~<CR>
nnoremap <F6> :Files .<CR>
nnoremap <F8> :Files ~/Notes<CR>

" Printing
set printoptions+=header:0

set printexpr=PrintFile(v:fname_in)
function! PrintFile(fname)
	call system("lp " . a:fname)
	call delete(a:fname)
	return v:shell_error
endfunc

