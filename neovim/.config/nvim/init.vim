"  _____ _
" |  |  |_|_____   ___   ___ ___
" |  |  | |     | |___| |  _|  _|
"  \___/|_|_|_|_|       |_| |___|

" basic appearence
syntax on
set cursorline
set number
set relativenumber
set termguicolors

autocmd VimResized * :wincmd =

" searching
set incsearch
set ignorecase
set hlsearch

" filetype
filetype on

" find
set path+=**
set wildmenu

" system clipboard
vnoremap <F11> "+y
nnoremap <F12> "+p

" formatting
set formatoptions=
set tabstop=4
set shiftwidth=4
set noexpandtab
set nojoinspaces

set conceallevel=0

if !&scrolloff
    set scrolloff=3
endif

" whitespace
set list
set listchars=tab:\|\ ,trail:-,extends:>,precedes:<,nbsp:+

" window movement
set wmh=0
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k

set wmw=0
nmap <C-h> <c-w>h
nmap <C-l> <c-w>l

set splitbelow
set splitright

" backup and safety
set nobackup
set writebackup
set noswapfile

" toggle between relative and normal line numbering
nnoremap <silent><F2> :set rnu!<CR>
nnoremap <F3> :make<CR>

" leader-key
let mapleader = ","

" close current buffer (go back to previous one)"
nnoremap <Leader>d :bd<CR>

nnoremap <Leader>o o<ESC><up>
nnoremap <Leader>O O<ESC><down>

nnoremap <silent><Leader>v :vsplit<CR>
nnoremap <silent><Leader>h :split<CR>

silent! colorscheme acretercolor

" terminal mode
tnoremap <Esc> <C-\><C-n>

" german umlauts
inoremap ö [
inoremap ä ]
inoremap Ö {
inoremap Ä }

nnoremap ö <c-]>

" marker
inoremap ß <ESC>/<marker><CR>cf>

" man
set keywordprg=:bo\ :vert\ :Man

" colorcolumn to avoid long lines
set colorcolumn=80
hi ColorColumn  guifg=#ff0000          guibg=DarkCyan       gui=NONE
            \   ctermfg=NONE        ctermbg=grey        cterm=NONE

" plugins
call plug#begin('~/.local/share/nvim/site/autoload/plugged')
	Plug 'morhetz/gruvbox'
	Plug 'mhartington/oceanic-next'
	Plug 'qpkorr/vim-renamer'
call plug#end()

nnoremap <TAB> :bp<CR>
nnoremap <S-TAB> :bn<CR>
