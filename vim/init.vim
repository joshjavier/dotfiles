let g:mapleader=" "

" Run PlugInstall if there are missing plugins
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation-of-missing-plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/vendor')

" Good defaults
if !has('nvim') && !exists('g:gui_oni') | Plug 'tpope/vim-sensible' | endif
Plug 'rstacruz/vim-opinion'

" COLOR SCHEMES: {{{
Plug 'gruvbox-community/gruvbox'
Plug 'romainl/Apprentice'

" Very fast fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Easy commenting with gc and gcc
Plug 'tpope/vim-commentary'

" Split explorer > project drawer
Plug 'tpope/vim-vinegar'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Distraction-free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" FILETYPE PLUGINS: {{{
Plug 'nathangrigg/vim-beancount'

call plug#end()
