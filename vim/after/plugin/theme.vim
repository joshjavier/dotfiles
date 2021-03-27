set background=dark
silent! colorscheme apprentice

if !has('gui_running')

  " Enable background transparency
  " Note: To properly override highlight groups, this must be placed AFTER
  " the setting of the colorscheme and background options (see `:help 'bg'`).
  highlight Normal guibg=NONE

  " Fix Limelight issue with transparent background
  " See: https://github.com/junegunn/limelight.vim/issues/39#issuecomment-466664354
  let g:limelight_conceal_guifg='#585858'

  " Add a subtle guide to encourage lines to be 80 characters or less
  set colorcolumn=80
  highlight ColorColumn guibg=#282828

endif

