" ctrl-s to save
nnoremap <C-s> :w<CR>

" edit and source config files
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ek :vsplit ~/.dotfiles/vim/after/plugin/key_bindings.vim<CR>
nnoremap <leader>eo :vsplit ~/.dotfiles/vim/after/plugin/options.vim<CR>

" escape like a ninja
inoremap jk <esc>
inoremap kj <esc>
