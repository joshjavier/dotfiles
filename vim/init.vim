let g:mapleader=","

" Run PlugInstall if there are missing plugins
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation-of-missing-plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/vendor')

if !has('nvim') && !exists('g:gui_oni')
  Plug 'tpope/vim-sensible'
endif
Plug 'rstacruz/vim-opinion'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
