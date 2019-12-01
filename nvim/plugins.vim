filetype off
call plug#begin('~/.local/share/nvim/plugged')
" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" UI
Plug 'iCyMind/NeoSolarized'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-bufferline'
Plug 'kshenoy/vim-signature'
Plug 'nathanaelkane/vim-indent-guides'
" Functionality
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-sleuth'
Plug 'wellle/targets.vim'
" Filetypes
Plug 'elzr/vim-json', {'for': 'json'}

call plug#end()

" Included Macros
runtime macros/matchit.vim

" Filetype detection
filetype plugin indent on

" Plugin configuration
"" fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \}
"let $FZF_DEFAULT_OPTS=' --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 --color info:254,prompt:37,spinner:108,pointer:235,marker:235 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(15)
  let width = float2nr(160)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
    \ 'relative': 'editor',
    \ 'row': vertical,
    \ 'col': horizontal,
    \ 'width': width,
    \ 'height': height,
    \ 'style': 'minimal'
    \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --smart-case '.shellescape(<q-args>), 1,
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
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
"" Startify
silent !mkdir ~/.cache/vim/sessions > /dev/null 2>&1
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_session_dir = '~/.cache/vim/sessions'
let g:startify_list_order = [['Sessions'], 'sessions', ['Bookmarks'], 'bookmarks', ['MRUs'], 'files', ['Directory'], 'dir']
let g:startify_bookmarks = ['~/.config/dotfiles/zsh/rc','~/.config/dotfiles/nvim/keys.vim','~/.config/dotfiles/nvim/plugins.vim', '~/.config/dotfiles/i3/config']
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

" Keys
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
"" Easy alignment
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
