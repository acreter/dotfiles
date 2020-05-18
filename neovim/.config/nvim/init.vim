"  _____ _
" |  |  |_|_____   ___   ___ ___
" |  |  | |     | |___| |  _|  _|
"  \___/|_|_|_|_|       |_| |___|

" make this .vimrc extensible
" set exrc	" I think this is not needed since this file should be at the
			" default path
set secure

" basic appearence
syntax on
set cursorline
set number
set relativenumber
set termguicolors
set background=dark

autocmd VimResized * :wincmd =

" searching
set incsearch
set ignorecase
set hlsearch

" poor man's fuzzy find (searches recursivly in sub-directories + tab
" completion)
set path+=**
" a proper selsection menu to complement that
set wildmenu

" use the system clipboard to easily copy to and from buffers
set clipboard+=unnamedplus

" formatting
set formatoptions+=c
set tabstop=4
set shiftwidth=4
set noexpandtab
set nojoinspaces
" set nowrap

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

nnoremap <Leader>r <c-w><c-p>

" backup and safety
set nobackup
set writebackup
set noswapfile

" colorcolumn to avoid long lines
set colorcolumn=80
highlight ColorColumn ctermbg=red

" toggle between relative and normal line numbering
nnoremap <silent><F2> :set rnu!<CR>
nnoremap <F3> :!make<CR>

" leader-key
let mapleader = ","

" close current buffer (go back to previous one)"
nnoremap <Leader>d :bd<CR>

nnoremap <Leader>o o<ESC><up>
nnoremap <Leader>O O<ESC><down>
nnoremap <Leader>t i/* TODO:  */<ESC>2hi

silent! colorscheme acretercolor

" terminal mode
tnoremap <Esc> <C-\><C-n>

" german umlauts
inoremap ö [
inoremap ä ]
inoremap Ö {
inoremap Ä }

nnoremap ö <c-]>

" snippets
" c
nnoremap <Leader>for :-1read $HOME/.config/nvim/snippets/c/for<CR>4la
nnoremap <Leader>while :-1read $HOME/.config/nvim/snippets/c/while<CR>6la
nnoremap <Leader>dowhile :-1read $HOME/.config/nvim/snippets/c/dowhile<CR>ja
nnoremap <Leader>if :-1read $HOME/.config/nvim/snippets/c/if<CR>3a

" tex
nnoremap <Leader>begin :-1read $HOME/.config/nvim/snippets/tex/begin<CR>6la
nnoremap <Leader>itemize :-1read $HOME/.config/nvim/snippets/tex/itemize<CR>jA
nnoremap <Leader>lemma :-1read $HOME/.config/nvim/snippets/tex/lemma<CR>ja
nnoremap <Leader>theorem :-1read $HOME/.config/nvim/snippets/tex/theorem<CR>ja
nnoremap <Leader>proof :-1read $HOME/.config/nvim/snippets/tex/proof<CR>ja

" marker
inoremap ß <ESC>/<marker><CR>cf>

" man
set keywordprg=:bo\ :vert\ :Man
