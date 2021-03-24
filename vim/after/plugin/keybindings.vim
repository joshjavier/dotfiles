" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Do not skip wrapped lines when moving up/down
nnoremap j gj
nnoremap k gk

" Clear the last search pattern (and remove highlight)
nnoremap <leader><space> :let @/ = ""<cr>

" Escape from insert and visual mode like a ninja
inoremap jk <esc>
inoremap kj <esc>
vnoremap jk <esc>
vnoremap kj <esc>

" ctrl-s to save
nnoremap <c-s> :w<cr>

" Edit and source config files
nnoremap <leader>ev :vsplit ~/.dotfiles/vim/init.vim<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ek :vsplit ~/.dotfiles/vim/after/plugin/key_bindings.vim<cr>
nnoremap <leader>eo :vsplit ~/.dotfiles/vim/after/plugin/options.vim<cr>
nnoremap <leader>et :vsplit ~/.dotfiles/vim/after/plugin/theme.vim<cr>

" fzf mappings
" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
if exists(':FZF')
  nnoremap <leader>f :GFiles<cr>
  nnoremap <leader>F :Files<cr>
  nnoremap <leader>b :Buffers<cr>
  nnoremap <leader>l :BLines<cr>
  nnoremap <leader>L :Lines<cr>
  nnoremap <leader>' :Marks<cr>
  nnoremap <leader>M :Maps<cr>
  nnoremap <leader>s :Filetypes<cr>
endif

" Move lines up or down
" https://vim.fandom.com/wiki/Moving_lines_up_or_down#Mappings_to_move_lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" System clipboard mappings
vnoremap <leader>cc "+y
noremap <leader>vv "+p
noremap <leader>aa <esc>ggVG

" Toggle wrap
nnoremap <leader>w :setlocal wrap!<cr>
