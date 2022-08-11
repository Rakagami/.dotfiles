syntax on

" =========================== General Settings ===========================
" Indentation Related
set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4
" Set line numbers visible
set nu
" Set no wrapping when line exceeds window width
set nowrap
" Set smart case when searching
set smartcase
" Backup related
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set undofile
" Searching related
set incsearch 
set relativenumber
set colorcolumn=100

" =========================== Plugins Independent =======================
" =======================================================================

if has("cscope")
	set csprg=/bin/cscope
	set csto=0
	set cst
	" add any database in current directory
	if filereadable("cscope.out")
	    silent cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    silent cs add $CSCOPE_DB
	endif
endif

" =========================== File Browsing ===========================
let g:netrw_banner=0    " disable Banner
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" =========================== Workflow related ===========================
"
" Plugin-Independent Quality of Life stuff
nnoremap ß $
vnoremap ß $
nnoremap ? $a
nnoremap m %
vnoremap m %

" Better mapleader key
let mapleader = " "

" Clipboard related
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Code Workflow
nnoremap <leader><Cr> :!
