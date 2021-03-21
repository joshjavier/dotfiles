" Fix terminal-specific issues for gruvbox
" https://github.com/gruvbox-community/gruvbox/wiki/Terminal-specific
if !has('gui_running')
  let g:gruvbox_italic=1
  set termguicolors
endif

colorscheme gruvbox
