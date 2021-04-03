setlocal textwidth=78

" Prefer indentation of 4 spaces (makes it easier to see the year)
setlocal softtabstop=4 shiftwidth=4 tabstop=4

if empty(glob('~/.vim/vendor/vim-beancount'))
  finish
endif

" Line up decimal points
nnoremap <buffer> <leader>= :AlignCommodity<CR>
vnoremap <buffer> <leader>= :AlignCommodity<CR>

" Automatically align commodities after typing a decimal point
inoremap <buffer> . .<C-\><C-O>:AlignCommodity<CR>
