set tw=78
set fo=t1pcwa

command -complete=custom,ListE -nargs=1 -range E normal <line1>ggO\begin{<args>}<Esc><line2>ggjo\end{<args>}<Esc><line1>ggv<line2>ggjj=
command -complete=custom,ListE -nargs=1 Ei execute "normal \<Esc>i\\begin{<args>}\<CR>\\end{<args>}<Esc>O<Space>" | startinsert
function ListE(A,L,P)
  return "align\nenumerate\nitemize\nfigure\ntabular\ntable\nlemma\nproof\n\ndocument\ntheorem"
endfunction

imap <Leader>i <C-Space> <Esc>:Ei<Space>
inoremap <Leader>m $$<marker><ESC>?\$<CR>i
inoremap <Leader>mc \mathcal{}<marker><ESC>?{<CR>a
inoremap <Leader>sc \textsc{}<marker><ESC>?{<CR>a

nnoremap <F4> :!zathura %:r.pdf &<CR>
