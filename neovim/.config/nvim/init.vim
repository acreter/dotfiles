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

" filetype
filetype on

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

" toggle between relative and normal line numbering
nnoremap <silent><F2> :set rnu!<CR>
nnoremap <F3> :!make<CR>
nnoremap <silent><F4> :!make && find . -maxdepth 1 -executable -type f -exec '{}' \;<CR>
nnoremap <F5> :!./run<CR>

" leader-key
let mapleader = ","

" close current buffer (go back to previous one)"
nnoremap <Leader>d :bd<CR>

nnoremap <Leader>o o<ESC><up>
nnoremap <Leader>O O<ESC><down>
nnoremap <Leader>t a/* TODO:  */<ESC>2hi
nnoremap <Leader>c a/*  */<ESC>2hi

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

" snippets
" c
autocmd Filetype c nnoremap <Leader>for :-1read $HOME/.config/nvim/snippets/c/for<CR>4la
autocmd Filetype c nnoremap <Leader>while :-1read $HOME/.config/nvim/snippets/c/while<CR>6la
autocmd Filetype c nnoremap <Leader>dowhile :-1read $HOME/.config/nvim/snippets/c/dowhile<CR>ja
autocmd Filetype c nnoremap <Leader>if :-1read $HOME/.config/nvim/snippets/c/if<CR>3a

" tex
autocmd Filetype tex,latex,plaintex nnoremap <Leader>begin :-1read $HOME/.config/nvim/snippets/tex/begin<CR>6la
autocmd Filetype tex,latex,plaintex nnoremap <Leader>itemize :-1read $HOME/.config/nvim/snippets/tex/itemize<CR>jA
autocmd Filetype tex,latex,plaintex nnoremap <Leader>lemma :-1read $HOME/.config/nvim/snippets/tex/lemma<CR>ja
autocmd Filetype tex,latex,plaintex nnoremap <Leader>theorem :-1read $HOME/.config/nvim/snippets/tex/theorem<CR>ja
autocmd Filetype tex,latex,plaintex nnoremap <Leader>proof :-1read $HOME/.config/nvim/snippets/tex/proof<CR>ja
autocmd Filetype tex,latex,plaintex nnoremap <Leader>m i$$<ESC>i
autocmd Filetype tex,latex,plaintex nnoremap <Leader>mc i\mathcal{}<ESC>i

" marker
inoremap ß <ESC>/<marker><CR>cf>

" man
set keywordprg=:bo\ :vert\ :Man

" colorcolumn to avoid long lines
set colorcolumn=80
hi ColorColumn  guifg=#ff0000          guibg=DarkCyan       gui=NONE
            \   ctermfg=NONE        ctermbg=grey        cterm=NONE

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" plugins
call plug#begin('~/.local/share/nvim/site/autoload/plugged')
	Plug 'benmills/vimux'
	nnoremap <Leader>vp :VimuxPromptCommand<CR>
	Plug 'morhetz/gruvbox'
	Plug 'mhartington/oceanic-next'
	Plug 'qpkorr/vim-renamer'
call plug#end()
