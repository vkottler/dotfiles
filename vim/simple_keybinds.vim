set nofixendofline

" quick insertion
nnoremap <Space> i_<Esc>r

" navigating tabs
nnoremap <leader>p :tabp<CR>
nnoremap <leader>n :tabn<CR>

" On a split keyboard, it's awkward to press '<leader>n'. Allow using 'b' as
" well.
nnoremap <leader>b :tabn<CR>

" fast reload settings
nnoremap <leader>rv :source $MYVIMRC<CR>
