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

" Color schemes
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

" Intellisense engine for vim
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Snippets (use with a snippet engine, e.g. coc-snippets)
Plug 'honza/vim-snippets'

" Git plugin for vim
Plug 'tpope/vim-fugitive'

" Autoclose parentheses (supports dot repeat)
Plug 'cohama/lexima.vim'

" Filetype plugins
Plug 'nathangrigg/vim-beancount'
Plug 'pangloss/vim-javascript'

call plug#end()
