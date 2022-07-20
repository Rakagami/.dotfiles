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

" =========================== Plugins Related ===========================
" =======================================================================
call plug#begin()

" Color-Scheme
Plug 'gruvbox-community/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'} " COCCCCC
Plug 'jiangmiao/auto-pairs' " For enabling automatic pair completion
Plug 'vim-airline/vim-airline' " Because it is cool
Plug 'tpope/vim-fugitive'


" Diagrams
Plug 'jbyuki/venn.nvim'

" Fuzzy finder
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'


call plug#end()
" =======================================================================

" =========================== Colors Related ===========================
colorscheme gruvbox
" highlight ColorColumn ctermbg=0 guibg=lightgrey
hi Normal ctermbg=NONE guibg=NONE
" hi Normal guibg=NONE
" set background=dark

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

" 'Window' navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
" nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
" These are pure joy, thanks ThePrimeagen
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J 1<C-d>
nnoremap K 1<C-u>

" Clipboard related
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Code Workflow
nnoremap <leader><Cr> :!

" COC Stuff
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
" Quickfix
nmap <leader>. <Plug>(coc-codeaction)
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Diagram Stuff
nmap <leader>d :set ve=all<CR>
nmap <leader>D :set ve=<CR>
vnoremap <leader>b :VBox<CR>

" FZF Stuff
nnoremap <C-p> :GFiles<CR>

" Vim Airline Stuff
" Disable integrations
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#fzf#enabled = 0

let g:airline#extensions#whitespace#enabled = 0
nnoremap <leader>w :AirlineToggleWhitespace<CR>
