if empty(glob('~/.vim/vendor/vim-beancount'))
  finish
endif

" Line up decimal points
nnoremap <buffer> <leader>= :AlignCommodity<CR>
vnoremap <buffer> <leader>= :AlignCommodity<CR>

" Automatically align commodities after typing a decimal point
inoremap <buffer> . .<C-\><C-O>:AlignCommodity<CR>
