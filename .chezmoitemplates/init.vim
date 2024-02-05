set nocompatible
let g:mapleader=" "

if has('win32') | let $HOME = $USERPROFILE | endif
if empty(glob($HOME.'/{{ . }}/autoload/plug.vim'))
  silent execute '!curl -fLo '.$HOME.'/{{ . }}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin($HOME.'/{{ . }}/vendor')

if !has('nvim') && !exists('g:gui_oni') | Plug 'tpope/vim-sensible' | endif
Plug 'rstacruz/vim-opinion'

call plug#end()
