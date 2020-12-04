set tw=78
set fo=ca

nnoremap <Leader>t a/* TODO:  */<ESC>2hi
nnoremap <Leader>c a/*  */<ESC>2hi

nnoremap <Leader>for :-1read $HOME/.config/nvim/snippets/c/for<CR>4la
nnoremap <Leader>while :-1read $HOME/.config/nvim/snippets/c/while<CR>6la
nnoremap <Leader>dowhile :-1read $HOME/.config/nvim/snippets/c/dowhile<CR>ja
nnoremap <Leader>if :-1read $HOME/.config/nvim/snippets/c/if<CR>3a
